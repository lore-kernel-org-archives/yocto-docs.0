Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D82BAC48286
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 16:51:03 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web10.46.1706806259008195907
 for <docs@lists.yoctoproject.org>;
 Thu, 01 Feb 2024 08:50:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=OYlQTVVG;
 spf=pass (domain: posteo.com, ip: 185.67.36.66, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 084A0240101
	for <docs@lists.yoctoproject.org>; Thu,  1 Feb 2024 17:50:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1706806257; bh=XUiWFbcdPolgVbzarJggq6gVytFPwjPTGO+0g3YsXOA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=OYlQTVVGIfghhgk97vFf0AyLQpPUVv1iJ0xepymplKxyrJ2JkEn3FwFvmyGQc0i4H
	 t9d4w1b23hZd836cR1u2rUEVW3cdqRC8xrrfNJd6nCPd/sU7Ne/bKcswDrb0tO4Qw1
	 7tirc5olAJXGfSCWVZXbmy/XFymFfE09K2DKg+TGQZb6fdzW1Xm/8gEnmd3ao3ggqs
	 c4aUVUJsnwWKobQYMrDg1zfjrFJHjUdRXCRWpiyuMeh2/+1mbtqyxvtG7HYGrtkHme
	 ZWHZ3c/evSxpxP9x1C4FGjVueg0UbS+oiwqHnbfT50J5Pbj20W7WkGND4cthRRK8Yz
	 JUXf363oj2HPw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TQlKD1GRtz9rxD;
	Thu,  1 Feb 2024 17:50:55 +0100 (CET)
From: simone.p.weiss@posteo.com
To: docs@lists.yoctoproject.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH] dev-manual: gen-tapdevs need iptables installed
Date: Thu,  1 Feb 2024 16:50:46 +0000
Message-Id: <20240201165046.28589-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 01 Feb 2024 16:51:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4805

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

Add the hint to the test setup that runqemu-gen-tapdevs will need the
iptables package installed.

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 documentation/dev-manual/runtime-testing.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/dev-manual/runtime-testing.rst b/documentation=
/dev-manual/runtime-testing.rst
index be1e8c02e..1a2e9ec4f 100644
--- a/documentation/dev-manual/runtime-testing.rst
+++ b/documentation/dev-manual/runtime-testing.rst
@@ -52,6 +52,8 @@ In order to run tests, you need to do the following:
          -  Be sure to use an absolute path when calling this script
             with sudo.
=20
+         -  Ensure that your host has the package ``iptables`` installed=
.
+
          -  The package recipe ``qemu-helper-native`` is required to run
             this script. Build the package using the following command::
=20
--=20
2.39.2


