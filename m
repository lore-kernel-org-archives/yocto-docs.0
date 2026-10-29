Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11251.1793278743055594697
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Oct 2026 05:59:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=HpeOS4Cz;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 569EDC49F43
	for <docs@lists.yoctoproject.org>; Thu, 29 Oct 2026 13:00:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F0ECF60360
	for <docs@lists.yoctoproject.org>; Thu, 29 Oct 2026 12:58:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2EFEB1032900F;
	Thu, 29 Oct 2026 13:58:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793278735; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Rj0R8q7KoqhVIgSjXTPZN5nN5UkDa9uuVUu3vueP/1E=;
	b=HpeOS4CzkTcFUD58MwS2otR8v1HzaKPk2n6sdNqk2o1AJtt+SZkGWpU2eU3nBF0z6parvE
	lmf097OI52t/L9ny+r2y4/d0nPOYmHsN0eHIsnHHRXUOtPKOvJYCSEk3yZ9w7uxpLbYk2m
	K0BDfgpJ7Aub5E2KRHKqxeTb5ZKVyFTRQSw4vSQU1kpw9BcbpJSmj4JXRnegSt56W/ozch
	wc+rOYhveBrN3bsokW3+nauYE5zEgYewSBBJ4misux7qh3hJIh27UZ01hs4GeIsL05yEUX
	oIiZJe2Nutd79q4Tv6Oj348fHxtWa08czCvdeZ9SKN4vFmKwdxVA0fgj/zD94Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/2] Rework admonition colors
Date: Thu, 29 Oct 2026 13:58:49 +0100
Message-Id: <20261029-admonitions-styling-v1-0-8990714284a1@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ7CIBCF4as0s5akUNDoVUwXFQYco9QwaGwId
 y+tyy957y/AmAgZLl2BhF9immODPHRg71MMKMg1g+rVUfbqLCb3miPlNmPBeXlSDMIYq91pQOk
 HDe35Tujpt1ev49/8uT3Q5i0Fta7xHj8SdwAAAA==
X-Change-ID: 20261029-admonitions-styling-55c4d73e1f34
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=511;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=K1WR2rImScpVqELBjS1nUf1sM8wis3bXb5jByIzaId4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq40MLirBAOjpL8z//1rziTtSGm2jaFMpv4Q8QH
 IGkz8VcupSJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCauNDCwAKCRDRgEFAKaOo
 Nv+cEADIxzDTO8/rnfwPgPS8RD6HLOM6LiLHBbwW4Z0z2PiQHWwPZL7rJaPlx6EzaqPw6a1zHau
 9MTcHgeYCLJRMZJOv1n7cQhVzzWFo6/hHQ4g4DzE4fKp0qRGHl7/szksvEF6n6hg0nGzgvpaqac
 0ZN+KTSMK3WH1TFhcTIoxM3mVd7jNgqjX+yXuhfW3DguySAPsfZmb8zKePRRJIcmQH4SLT8b4Ld
 0HQcvsIuhNO9yidJaJxo2FVVkHGZJAFHXn021mXB51oSMeEBl8RSH18XdWgZ+SJg5meMwbYAQAk
 jC8QdHBIkYuyd5knC0QpIJb/nIVBpwYSmb4+O1HnZKi8vBqex7fN0iGGSsF04krbCByh+XJu0Nj
 UdCkCIJbOxkEvv0iXRigLUn/ELiDClIfiAiK+ZdLNcSHh63KkL7+yU83UMZrcy4q5XDhYGxxX87
 9FZyazcPTFLv70RaDk9MVsZniClpU1WxwpVosi2TT/IjpFf7BYxwudC+g5iRXZ6SVLjOAuRDiF2
 Ljlw+ToxjjS6o3KyBfujEgnlyfS9cOrxp2Lu6DFdRLfk27Ay26gsujc/1CYT0b1ocw/nprmOpnu
 jG9vPyeyOpSHMDRrJFeUMWjKmn0mQ9ycACzMMEZH5jrCACKZWDWL8LXXq8VmQm8X10B8Q1vBTFX
 eYejl6jUISSaS2g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Thu, 29 Oct 2026 12:59:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10740

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (2):
      theme_overrides.css: rework admonition colors
      standards.md: update our admonitions encouraged usage

 documentation/sphinx-static/theme_overrides.css | 45 +++++++++++++++++++------
 documentation/standards.md                      |  9 ++---
 2 files changed, 38 insertions(+), 16 deletions(-)
---
base-commit: 7b54854d12f3f2c909727702d39066a3d22a4a40
change-id: 20261029-admonitions-styling-55c4d73e1f34

