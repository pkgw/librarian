# schema for Librarian DB

create table source (
    id              integer         not null auto_increment,
    name            varchar(254)    not null,
    authenticator   varchar(254)    not null,
    create_time     double          not null,
    primary key (id)
) engine=InnoDB;

/* clone of M&C table */

create table observation (
    id              integer         not null,
    source_id       integer         not null,
    julian_date     double          not null,
    polarization    char(4)         not null,
    length_days     double          not null,
    primary key (id)
) engine=InnoDB;

create table store (
    id              integer         not null auto_increment,
    name            varchar(254)    not null,
    create_time     double          not null,
    capacity        double          not null,
    used            double          not null,
    rsync_base      varchar(254)    not null,
    primary key (id)
) engine=InnoDB;

create table file (
    id              integer         not null auto_increment,
    name            varchar(254)    not null,
    type            char(64)        not null,
    create_time     double          not null,
    obs_id          integer         not null,
    source_id       integer         not null,
    store_id        integer         not null,
    size            double          not null,
    md5             varchar(254)    not null,
    deleted         tinyint         not null,
    deleted_time    double          not null,
    primary key (id)
) engine=InnoDB;

create table task (
    id              integer         not null auto_increment,
    create_time     double          not null,
    file_name       varchar(254)    not null,
    remote_site     varchar(254)    not null,
    remote_store    varchar(254)    not null,
    in_progress     tinyint         not null,
    delete_when_done    tinyint     not null,
    state           integer         not null,
    completed       tinyint         not null,
    completed_time  double          not null,
    last_error      varchar(254)    not null,
    last_error_time double          not null,
    primary key (id)
) engine=InnoDB;
