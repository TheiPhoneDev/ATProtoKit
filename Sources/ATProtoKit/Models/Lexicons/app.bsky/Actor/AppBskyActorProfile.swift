//
//  AppBskyActorProfile.swift
//
//
//  Created by Christopher Jr Riley on 2024-05-17.
//

import Foundation

extension AppBskyLexicon.Actor {

    /// The main data model definition for an actor.
    ///
    /// - Note: According to the AT Protocol specifications: "A declaration of a Bluesky
    /// account profile."
    ///
    /// - SeeAlso: This is based on the [`app.bsky.actor.profile`][github] lexicon.
    ///
    /// [github]: https://github.com/bluesky-social/atproto/blob/main/lexicons/app/bsky/actor/profile.json
    public struct ProfileRecord: ATRecordProtocol, Sendable {

        /// The identifier of the lexicon.
        ///
        /// - Warning: The value must not change.
        public static let type: String = "app.bsky.actor.profile"

        /// The display name of the profile. Optional.
        public let displayName: String?

        /// The description of the profile. Optional.
        ///
        /// - Note: According to the AT Protocol specifications: "Free-form profile
        /// description text."
        public let description: String?

        /// The avatar image URL of the profile. Optional.
        ///
        /// - Note: According to the AT Protocol specifications: "Small image to be displayed next
        /// to posts from account. AKA, 'profile picture'"
        ///
        /// - Note: Only JPEGs and PNGs are accepted.
        public let avatarBlob: ComAtprotoLexicon.Repository.BlobContainer?

        /// The banner image URL of the profile. Optional.
        ///
        /// - Note: According to the AT Protocol specifications: "Larger horizontal image to
        /// display behind profile view."
        ///
        /// - Note: Only JPEGs and PNGs are accepted.
        public let bannerBlob: ComAtprotoLexicon.Repository.BlobContainer?

        /// An array of user-defined labels. Optional.
        ///
        /// - Note: According to the AT Protocol specifications: "Self-label values, specific to
        /// the Bluesky application, on the overall account."
        public let labels: [ComAtprotoLexicon.Label.SelfLabelsDefinition]?

        /// The starter pack the user account used to join Bluesky. Optional.
        public let joinedViaStarterPack: ComAtprotoLexicon.Repository.StrongReference?

        /// A post record that's pinned to the profile. Optional.
        public let pinnedPost: ComAtprotoLexicon.Repository.StrongReference?

        /// The date and time the profile was created. Optional.
        @DateFormattingOptional public var createdAt: Date?

        enum CodingKeys: String, CodingKey {
            case displayName
            case description
            case avatarBlob = "avatar"
            case bannerBlob = "banner"
            case labels
            case joinedViaStarterPack
            case createdAt
            case pinnedPost
        }
    }
}
