//
//  AuthenticationViewModel.swift
//  JobFinderApp
//
//  Created by omer elmas on 25.07.2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

@MainActor
class AuthenticationViewModel: ObservableObject {
    @Published var userSession : FirebaseAuth.User?
    @Published var currentUser : User?
    @Published var errorMessage: String?

    
    init() {
        self.userSession = Auth.auth().currentUser
        Task { await fetchData()}
    }
    
    func signIn(withEmail email: String , password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchData()
        } catch {
            self.errorMessage = "Failed to log in with error: \(error.localizedDescription)"

        }
    }

    
    func createUser(withEmail email: String , password: String , fullname: String) async throws {
        
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullname: fullname, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchData()
        } catch {
            self.errorMessage = "error: \(error.localizedDescription)"

        }
        
    }
    
    func signOut(){
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
            self.errorMessage = nil
        }catch {
            print("DEBUG: FAILED TO SIGN OUT WITH ERROR \(error.localizedDescription)")

        }
    }
    
    
    
    
    func fetchData() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        
        self.currentUser = try? snapshot.data(as: User.self)
    }
}
