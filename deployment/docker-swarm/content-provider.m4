
    content-provider-service:
        image: ssai_content_provider_frontend:latest
        environment:
            NO_PROXY: "*"
            no_proxy: "*"
        volumes:
            - ${VIDEO_ARCHIVE_VOLUME}:/var/www/archive:ro
            - ${VIDEO_CACHE_VOLUME}:/var/www/video:ro
        networks:
            - appnet
        deploy:
            replicas: 1
            placement:
                constraints:
                    - node.role==manager
                    - node.labels.vcac_zone!=yes
