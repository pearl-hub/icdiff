
post_install() {
    [[ -e ${PEARL_PKGVARDIR} ]] && rm -rf ${PEARL_PKGVARDIR}/*

    cd ${PEARL_PKGVARDIR}
    download https://raw.githubusercontent.com/jeffkaufman/icdiff/master/icdiff
    download https://raw.githubusercontent.com/jeffkaufman/icdiff/master/git-icdiff

    chmod +x ${PEARL_PKGVARDIR}/icdiff
    chmod +x ${PEARL_PKGVARDIR}/git-icdiff

    link_to_path ${PEARL_PKGVARDIR}/icdiff
    link_to_path ${PEARL_PKGVARDIR}/git-icdiff

    link git ${PEARL_PKGDIR}/gitconfig
}

post_update() {
    post_install
}

pre_remove() {
    unlink git ${PEARL_PKGDIR}/gitconfig

    unlink_from_path ${PEARL_PKGVARDIR}/icdiff
    unlink_from_path ${PEARL_PKGVARDIR}/git-icdiff
    rm -rf ${PEARL_PKGVARDIR}/*
}
