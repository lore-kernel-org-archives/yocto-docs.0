Received: from adige.pair.com (adige.pair.com [209.68.5.114])
 by mx.groups.io with SMTP id smtpd.web10.25015.1586987379386485942
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Apr 2020 14:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 209.68.5.114, mailfrom: bluelightning@bluelightning.org)
Received: from adige.pair.com (localhost [127.0.0.1])
	by adige.pair.com (Postfix) with ESMTP id 47618959CA
	for <docs@lists.yoctoproject.org>; Wed, 15 Apr 2020 17:49:38 -0400 (EDT)
Received: from linc.fritz.box (unknown [IPv6:2406:e003:130a:e501:bc33:44c8:4f44:4e95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by adige.pair.com (Postfix) with ESMTPSA id 89113959B1
	for <docs@lists.yoctoproject.org>; Wed, 15 Apr 2020 17:49:37 -0400 (EDT)
From: "Paul Eggleton" <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH 0/2] Doc updates for the 3.1 release
Date: Thu, 16 Apr 2020 09:49:31 +1200
Message-Id: <cover.1586987359.git.bluelightning@bluelightning.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Migration guide for 3.1, and since I noticed it was missing there's an
update for the npm fetcher changes.


The following changes since commit 7f391a0656442e7ee2f3dd48b848befb7f461a=
ec:

  dev-manual: use "git", not "apmd", to explain checksum names (2020-04-0=
6 16:52:58 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib paule/doc-updates-3.1
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dpaule/doc-up=
dates-3.1

Paul Eggleton (2):
  dev-manual: basic updates for npm fetcher changes
  ref-manual: add migration section for 3.1

 .../dev-manual/dev-manual-common-tasks.xml    |  52 ++---
 documentation/ref-manual/migration.xml        | 201 ++++++++++++++++++
 2 files changed, 222 insertions(+), 31 deletions(-)

--=20
2.20.1

