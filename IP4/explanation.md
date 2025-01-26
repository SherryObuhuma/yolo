# EXPLANATION OF IP4

## Choice of Kubernetes Objects
- **StatefulSet**: Used for database deployment to ensure stable storage and consistent pod identity.
- **Deployments**: Used for frontend and backend as they are stateless applications.
- **Services**: Expose pods and enable communication between them.

## Exposing Pods
- The frontend uses a LoadBalancer service to expose it publicly.
- Backend uses a ClusterIP service for internal communication.
- The database uses a headless service for direct pod access.

## Persistent Storage
- A Persistent Volume and Persistent Volume Claim ensure database data persists even if the pod is deleted.

## Labels and Annotations
- Labels used to identify pods and for service selection.

