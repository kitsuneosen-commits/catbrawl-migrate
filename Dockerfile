FROM postgres:16-alpine
COPY migrate.sh /migrate.sh
RUN chmod +x /migrate.sh
CMD ["/migrate.sh"]
