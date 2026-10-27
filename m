Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18542.1793107108388453125
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Oct 2026 06:18:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=VhDiYtYU;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8152AC5846F;
	Tue, 27 Oct 2026 13:19:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 04E16603BD;
	Tue, 27 Oct 2026 13:18:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C849A10329044;
	Tue, 27 Oct 2026 14:18:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793107101; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uIB3soAuGlM+XBAm5RQ3zJDJECjCLAfl6MIJ01bYoVg=;
	b=VhDiYtYUpURC/z+qknk0n9ZYCvjNrVSqLimc3L4lyBgCAEmQS0Ppb8LV3gIDfKgjCbVqtU
	Razlv3lVJWXlmQpCexhJ2zI96+V5gy9yzYTJcDbEu5fBRjco2/6RJ79BvfwTJay8EJUvL4
	25n15V/GWFQoxK/BkQG01MHLZ3HE5CZcbIuANy6akY0Jcq6TcvC0JmR0bRVxxGrD/s/ydo
	mgP6tCGw3lFaHO53Yih8z5HoBPlJjbQ7+Kd/faAM1P37ejMka1jTuDWrLXEALPFc09CK94
	9BE0EgX0zMCC3fAPYHKpI6Sjk9VDUJRTh+Ay/CueaeQo7xKDwIMMS9cawmCrog==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	AdrianF <adrian.freihofer@siemens.com>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v4 0/4] dev-manual/devtool: ide-sdk doc rewrite and Mermaid diagrams
Date: Tue, 27 Oct 2026 14:17:40 +0100
Message-ID: <179310701142.402741.2732711232253529413.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020084359.354498-1-adrian.freihofer@siemens.com>
References: <20261020084359.354498-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Tue, 27 Oct 2026 13:18:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10723

Applied to master, thanks!

[3/4] dev-manual/devtool: add diagrams for the ide-sdk workflow and archi=
tecture
      https://git.yoctoproject.org/yocto-docs/commit/?id=3D435a5bd3e767
[4/4] dev-manual/devtool: convert add/modify/upgrade flow diagrams to Mer=
maid
      https://git.yoctoproject.org/yocto-docs/commit/?id=3D13026b52ae6e
