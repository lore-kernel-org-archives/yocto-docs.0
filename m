Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11309.1792588647705202923
 for <docs@lists.yoctoproject.org>;
 Wed, 21 Oct 2026 06:17:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=H2HVLqn8;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3791FC5CD75
	for <docs@lists.yoctoproject.org>; Wed, 21 Oct 2026 13:18:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 44EE5606E3;
	Wed, 21 Oct 2026 13:17:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DBE7910328A96;
	Wed, 21 Oct 2026 15:17:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792588644; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bu5mm9n7Y8GGYP6szwWmFFJpWLXBoph/YaC8ztdEzfM=;
	b=H2HVLqn8XlXdQ+8FAzF28V5p/ze/UdlZkZcMUKB1qbxv5UqJxxOsBxrU/AJF9Q3OYz3eCD
	3xyuOJdWgq58lNGNVgCjjvQAV7WgXKg+PF5qRIsX7+/HPbDnyPkwrNnoyYUZvFh2q8TiPR
	zUdaO+trdCKNVTzIfBwcqZWuuo60M5QK6pVWU4hP4N/cLnXY7oT/leo6Vbh/dn4aXguWpG
	THOLmqmNaZPYnahTtcAK2gAaKfnf3T+cLiWQ1A24fow3cFLfz62eR91/AGgb3BQXh2qNGJ
	14rml7aNtphbR8xDQtPhpizsZ9qnGvR+VUyu46T9orBP+c8oc/LuvL4T2lMMgA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 15:17:23 +0200
Message-Id: <DMAJN2542SSX.26USJY9HMAASK@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <adrian.freihofer@siemens.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v4 0/4] dev-manual/devtool: ide-sdk doc rewrite
 and Mermaid diagrams
References: <20261020084359.354498-1-adrian.freihofer@siemens.com>
In-Reply-To: <20261020084359.354498-1-adrian.freihofer@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Wed, 21 Oct 2026 13:17:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10708

On Tue Oct 20, 2026 at 10:43 AM CEST, Adrian Freihofer via lists.yoctoproje=
ct.org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>
> Update the "devtool ide-sdk" section to reflect its current behavior,
> and fix outdated non-patch local file handling docs (5.1 change).
[...]

Applied to master-next, thanks!

Antonin
