enum CollectionType { user, conversations, unknown }

String firebaseCollectionType(CollectionType? type) {
  switch (type) {
    case CollectionType.user:
      return 'user';
    case CollectionType.conversations:
      return 'conversations';
    default:
      return '';
  }
}

CollectionType? toFirebaseCollectionType(String? type) {
  switch (type) {
    case 'user':
      return CollectionType.user;
    case 'conversations':
      return CollectionType.conversations;
    default:
      return CollectionType.unknown;
  }
}
