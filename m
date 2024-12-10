Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26562E77180
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 10:00:38 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.6757.1733824830276455115
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Dec 2024 02:00:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XMNL1Pa/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BD80740003;
	Tue, 10 Dec 2024 10:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733824828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6IyrXf4bheNPGG5u/FrHLEIsMvYNq+gRakk29HzJ8q0=;
	b=XMNL1Pa/AdGioK6ziwe7JQ0dqnHNUffibaUseCHthQ9WN79O02E65wCJ8G/IEpeolFST4N
	lsNRg59mc1wWcnnKreExCumeE/TYrG9YMJ4l2opjt635Ghxvv5KiG5/j1Xx/05pNAkDp7Q
	lXXo3xv8OtL2DRr8/K8Wr60N3/QsM8S+fvcTNU/Y0fR0tJvEplslzH7xR7eR/ijZ6K7uWJ
	TCk9Mg6bHDknk5zCagjIxhooqSJ0TzSweJxiKEI29wczU+dJxvko/lb2MMzoJ8gn0W1g08
	e/8JExwB7+vei0rRA02hc1u/aCvaqpOVJM/Rz8UX8aydCHhoUsoX4uPJcsaNLg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 10 Dec 2024 11:00:23 +0100
Subject: [yocto-docs PATCH v3 5/6] system-requirements: update list of
 supported distros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-update-doc-deps-v3-5-534699936ddc@bootlin.com>
References: <20241210-update-doc-deps-v3-0-534699936ddc@bootlin.com>
In-Reply-To: <20241210-update-doc-deps-v3-0-534699936ddc@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=977;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=KggEsCcyK4Ny1MaOzyvM5MtszydIjcp95Caq09iYLcQ=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnWBE6nyP3u+soAhsZXlJQFg8LbAMukEVWy+RwJ
 tLehOyGsaiJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ1gROgAKCRDRgEFAKaOo
 Njg0D/sHV/KFKNXEpj1AfOkka0PfEQu0qPRMMo2InJ3+rowiH3KKFbBwTxvwCZEDXn2Zepj0MRW
 ep79TGSETb4IljAWP2pKJCY3nTiiooqjq8y2CxB9j/FrJJKxQzFN0X1XUQMCWNf/pqIVKOT8izv
 X7V1q6x57eehN0gLgRBWUfe7XcG60FhTiPqQdo0BV7t+Yp5RggwvhnvbFTeyctX9N+1dLmiM3w4
 izzLmk6F10RvVI4eP6UzqI5ziqhkMBRtb7DDhpJRewyJz6+KQPolGWMENCYJLw/E9t0P0L0p2CV
 1nZXgklOaWdDo6FYM8CN0GvvH1WugkiLZjL6sOVYsdTRo6D/FGIiUDB/gqMf8aIEyzIxnENo8Z+
 q2j1LfU2Voyj7H2urNzWPrYV2/XlGDWImdsbSvTiE5/kp2LaFT/vgRcmNPLo9ChZK1lRz2cBBo9
 Y8jZeBdkTuOiffA54H2ceZIKM9NAgTro8PjkZ5iZR5BcnvrCI+WL84nUgXrGjmxIlsOGmbsmeHV
 ecB07hL9ReageQXFViLuZdpNxXinN4bROWWqMP/T5vuhk0RYtcOatpRK50GbOjZZm9HdKBBf16m
 VdN/6fi+f53MS2IA78ns1fgIDU2iS4AdTEyBMlhdM9Q1fecpJhNqJ0zHY6l1g0Wk6nqiNwkgfav
 I3teTsud+wHhsEg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 10 Dec 2024 10:00:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5915

To match the list in meta-poky/conf/distro/poky.conf.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/system-requirements.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 17ad1b741a0b92f218860d22bbc4b0927b73b865..7c7f518d9fe1f68e5b014cf31e59dc9bbe322e4c 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -62,10 +62,14 @@ supported on the following distributions:
 
 -  Ubuntu 22.04 (LTS)
 
+-  Ubuntu 24.04 (LTS)
+
 -  Fedora 38
 
 -  Fedora 39
 
+-  Fedora 40
+
 -  CentOS Stream 8
 
 -  Debian GNU/Linux 11 (Bullseye)
@@ -74,6 +78,10 @@ supported on the following distributions:
 
 -  OpenSUSE Leap 15.4
 
+-  OpenSUSE Leap 15.5
+
+-  OpenSUSE Leap 15.6
+
 -  AlmaLinux 8
 
 -  AlmaLinux 9

-- 
2.47.1


