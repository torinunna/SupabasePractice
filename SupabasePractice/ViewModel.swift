//
//  ViewModel.swift
//  SupabasePractice
//
//  Created by YUJIN KWON on 2023/11/25.
//

import Foundation
import Supabase

enum Table {
    static let features = "Features"
}

enum AuthAction: String, CaseIterable {
    case signUp = "Sign Up"
    case signIn = "Sign In"
}

final class ViewModel: ObservableObject {
    
    @Published var isAuthenticated = false
    @Published var authAction: AuthAction = .signUp
    
    @Published var features = [Feature]()
    
    @Published var showingAuthView = false
    @Published var email = ""
    @Published var password = ""
    
    let supabase = SupabaseClient(supabaseURL: Secrets.projectURL, supabaseKey: Secrets.apiKey)
    
    // MARK: - Database
    
    func createFeatureRequest(text: String) async throws {
    }
    
    func fetchFeatureRequests() async throws {
        let features: [Feature] = try await supabase.database
            .from(Table.features)
            .select()
            .order("created_at", ascending: false)
            .execute()
            .value
        
        DispatchQueue.main.async {
            self.features = features
        }
    }
    
    func update(_ feature: Feature, with text: String) async {
    }
    
    func deleteFeature(at id: Int) async throws {
    }
    
    // MARK: - Authentication
    
    func signUp() async throws {
    }
    
    func signIn() async throws {
    }
    
    func isUserAuthenticated() async {
    }
    
    func signOut() async throws {
    }
    
    func authorize() async throws {
    }
}
