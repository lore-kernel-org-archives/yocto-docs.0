Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59110C7115B
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 19:10:02 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.4402.1750446595747661969
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Jun 2025 12:09:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=0sLoYGmU;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hnCl3ch5XCxCbc8wVHETLvDPKZFi6i3HcCcTOzuVkGI=; b=0sLoYGmUCanLwXduO5J0z+VwwF
	+j5BDHvvI0wfkxX3UkmRUdMeHOHNTp88tpgikumN8P7P2kbgYVR498qhOIW1/MV35WlJ/qnVnby0U
	Ul1ZxhYHhfyMSaDmzu0n4g/Arxxs/xxh7pzxdDAdd4XjvHrE/Ul9xpAhWaOumf/3dTOqJV0hxF+y3
	fiJTXpjM8kaznJZDwzi5augaZtyJNRsQs/sX3rnEQynxpOx+BOPdURjC1yfq9lBtSEbBZnbNiekmV
	PLwzPAr+XyTXhanc9MFZjFnetyHw6Mlv0yjQkZi651TFYlNXrI3TxObhnFJ2fFY8uqhqflsHg59fS
	lHfYiTWA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:60682 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uSh7P-000000006QV-1Fkq
	for docs@lists.yoctoproject.org;
	Fri, 20 Jun 2025 15:09:54 -0400
Date: Fri, 20 Jun 2025 15:09:37 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual, CH 5: grammar fixes and update recipes
Message-ID: <23ac0815-60ab-fef4-533b-920e61f5d38b@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Jun 2025 19:10:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7127


Major updates:

  - update strace recipe version
  - replace git example with gnuplot, which actually has two
    SRC_URI values that need naming

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index c49881efe..8e071c4d4 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -276,11 +276,11 @@ upgrading the recipe to a future version is as simple as renaming the
 recipe to match the new version.

 Here is a simple example from the
-``meta/recipes-devtools/strace/strace_5.5.bb`` recipe where the source
+``meta/recipes-devtools/strace/strace_6.15.bb`` recipe where the source
 comes from a single tarball. Notice the use of the
 :term:`PV` variable::

-   SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
+   SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/strace-${PV}.tar.xz \

 Files mentioned in :term:`SRC_URI` whose names end in a typical archive
 extension (e.g. ``.tar``, ``.tar.gz``, ``.tar.bz2``, ``.zip``, and so
@@ -304,27 +304,31 @@ fetched from a remote server other than a version control system,
 BitBake attempts to verify the files against checksums defined in your
 recipe to ensure they have not been tampered with or otherwise modified
 since the recipe was written. Multiple checksums are supported:
-``SRC_URI[md5sum]``, ``SRC_URI[sha1sum]``, ``SRC_URI[sha256sum]``.
+``SRC_URI[md5sum]``, ``SRC_URI[sha1sum]``, ``SRC_URI[sha256sum]``,
 ``SRC_URI[sha384sum]`` and ``SRC_URI[sha512sum]``, but only
 ``SRC_URI[sha256sum]`` is commonly used.

 .. note::

-   ``SRC_URI[md5sum]`` used to also be commonly used, but it is deprecated
-   and should be replaced by ``SRC_URI[sha256sum]`` when updating existing
+   ``SRC_URI[md5sum]`` used to be common, but is now deprecated
+   in favour of ``SRC_URI[sha256sum]`` when updating existing
    recipes.

 If your :term:`SRC_URI` variable points to more than a single URL (excluding
 SCM URLs), you need to provide the ``sha256`` checksum for each URL. For these
 cases, you provide a name for each URL as part of the :term:`SRC_URI` and then
 reference that name in the subsequent checksum statements. Here is an example
-combining lines from the files ``git.inc`` and ``git_2.24.1.bb``::
+from the recipe file ``gnuplot_5.4.3.bb``, which has two ``SRC_URI`` values that
+require naming::

-   SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
-              ${KERNELORG_MIRROR}/software/scm/git/git-manpages-${PV}.tar.gz;name=manpages"
+   SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${PV}/${BP}.tar.gz;name=archive \
+              http://www.mneuroth.de/privat/zaurus/qtplot-0.2.tar.gz;name=qtplot \
+              file://gnuplot.desktop \
+              file://gnuplot.png \
+              "

-   SRC_URI[tarball.sha256sum] = "ad5334956301c86841eb1e5b1bb20884a6bad89a10a6762c958220c7cf64da02"
-   SRC_URI[manpages.sha256sum] = "9a7ae3a093bea39770eb96ca3e5b40bff7af0b9f6123f089d7821d0e5b8e1230"
+   SRC_URI[archive.sha256sum] = "51f89bbab90f96d3543f95235368d188eb1e26eda296912256abcd3535bd4d84"
+   SRC_URI[qtplot.sha256sum] = "6df317183ff62cc82f3dcf88207a267cd6478cb5147f55d7530c94f1ad5f4132"

 The proper value for the ``sha256`` checksum might be available together
 with other signatures on the download page for the upstream source (e.g.

