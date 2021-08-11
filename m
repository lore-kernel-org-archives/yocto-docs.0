Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web09.5103.1628672003415158005
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Aug 2021 01:53:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:56126 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mDjzG-0002Dy-2V
	for docs@lists.yoctoproject.org; Wed, 11 Aug 2021 04:53:21 -0400
Date: Wed, 11 Aug 2021 04:53:18 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: WKS_FILE versus WKS_FILES? and more WKS_FILE_* variables
Message-ID: <77e44126-da4d-5afa-6fa-125b694c6d@crashcourse.ca>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII


  digging into wic and wks files for the first time, and notice that
variable glossary refers to WKS_FILE but not WKS_FILES:

http://docs.yoctoproject.org/ref-manual/variables.html#term-WKS_FILE

and there seem to be other WKS_FILE* variables not in the VG:

WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' %
os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
do_image_wic[file-checksums] += "${WKS_FILE_CHECKSUM}"

WKS_FILE_DEPENDS_DEFAULT = '${@bb.utils.contains_any("BUILD_ARCH", [
'x86_64', 'i686' ], "syslinux-native", "",d)}'
WKS_FILE_DEPENDS_DEFAULT += "bmap-tools-native cdrtools-native
btrfs-tools-native squashfs-tools-native e2fsprogs-native"

WKS_FILE_DEPENDS_BOOTLOADERS = ""
os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
do_image_wic[file-checksums] += "${WKS_FILE_CHECKSUM}"

and so on.

  as soon as some crippling deadlines are over in the next few days, i
will try to be useful.

rday
