Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by mx.groups.io with SMTP id smtpd.web09.34184.1628844587982911554
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Aug 2021 01:49:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: menlosystems.com, ip: 212.18.0.9, mailfrom: o.mandel@menlosystems.com)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4GmHL56cwNz1qwyB;
	Fri, 13 Aug 2021 10:49:33 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 4GmHL56Fhbz1qqy7;
	Fri, 13 Aug 2021 10:49:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id 0jPYM1BLOtKk; Fri, 13 Aug 2021 10:49:33 +0200 (CEST)
X-Auth-Info: JPQrBUZ8rxFtEffnleyFyVF4oAiCe04sDxZlMzF74bWtnDPx0ZXMgiKld0jV363V
Received: from menlobldserver.menlosystems.local (host-82-135-125-165.customer.m-online.net [82.135.125.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 13 Aug 2021 10:49:33 +0200 (CEST)
From: o.mandel@menlosystems.com
To: docs@lists.yoctoproject.org
Cc: Olaf Mandel <o.mandel@menlosystems.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH v3] kickstart: document which options accept units
Date: Fri, 13 Aug 2021 08:48:55 +0000
Message-Id: <20210813084855.9693-1-o.mandel@menlosystems.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210813083743.g4a2iax2ybxusamc@fedora>
References: <20210813083743.g4a2iax2ybxusamc@fedora>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Document which units are accepted as parameters for the four options
that accept units. Also be pedantic about using binary instead of
decimal prefixes so readers don't have to wonder.

Signed-off-by: Olaf Mandel <o.mandel@menlosystems.com>
Reviewed-by: Quentin Schulz <foss@0leil.net>
---
 documentation/ref-manual/kickstart.rst | 30 +++++++++++++++++---------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/documentation/ref-manual/kickstart.rst b/documentation/ref-m=
anual/kickstart.rst
index fc723ccbe..595b9e8c1 100644
--- a/documentation/ref-manual/kickstart.rst
+++ b/documentation/ref-manual/kickstart.rst
@@ -65,13 +65,17 @@ Here is an example that uses "/" as the mountpoint. T=
he command uses
 Here is a list that describes other supported options you can use with
 the ``part`` and ``partition`` commands:
=20
--  ``--size``: The minimum partition size in MBytes. Specify an
-   integer value such as 500. Do not append the number with "MB". You do
-   not need this option if you use ``--source``.
-
--  ``--fixed-size``: The exact partition size in MBytes. You cannot
-   specify with ``--size``. An error occurs when assembling the disk
-   image if the partition data is larger than ``--fixed-size``.
+-  ``--size``: The minimum partition size. Specify as an integer value
+   optionally followed by one of the units "k" / "K" for kibibyte,
+   "M" for mebibyte and "G" for gibibyte. The default unit if none is
+   given is "M". You do not need this option if you use ``--source``.
+
+-  ``--fixed-size``: The exact partition size. Specify as an integer
+   value optionally followed by one of the units "k" / "K" for kibibyte,
+   "M" for mebibyte and "G" for gibibyte. The default unit if none is
+   given is "M".  Cannot be specify together with ``--size``. An error
+   occurs when assembling the disk image if the partition data is larger
+   than ``--fixed-size``.
=20
 -  ``--source``: This option is a Wic-specific option that names the
    source of the data that populates the partition. The most common
@@ -134,10 +138,13 @@ the ``part`` and ``partition`` commands:
 -  ``--align (in KBytes)``: This option is a Wic-specific option that
    says to start partitions on boundaries given x KBytes.
=20
--  ``--offset (in KBytes)``: This option is a Wic-specific option that
+-  ``--offset``: This option is a Wic-specific option that
    says to place a partition at exactly the specified offset. If the
    partition cannot be placed at the specified offset, the image build
-   will fail.
+   will fail. Specify as an integer value optionally followed by one of
+   the units "s" / "S" for 512Byte sector, "k" / "K" for kibibyte, "M"
+   for mebibyte and "G" for gibibyte. The default unit if none is given
+   is "k".
=20
 -  ``--no-table``: This option is a Wic-specific option. Using the
    option reserves space for the partition and causes it to become
@@ -151,7 +158,10 @@ the ``part`` and ``partition`` commands:
 -  ``--extra-space``: This option is a Wic-specific option that adds
    extra space after the space filled by the content of the partition.
    The final size can exceed the size specified by the ``--size``
-   option. The default value is 10 Mbytes.
+   option. The default value is 10M. Specify as an integer value
+   optionally followed by one of the units "k" / "K" for kibibyte, "M"
+   for mebibyte and "G" for gibibyte. The default unit if none is given
+   is "M".
=20
 -  ``--overhead-factor``: This option is a Wic-specific option that
    multiplies the size of the partition by the option's value. You must
--=20
2.20.1

