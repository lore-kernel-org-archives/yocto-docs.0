Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1318.1795710830037213445
 for <docs@lists.yoctoproject.org>;
 Thu, 26 Nov 2026 08:33:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Vn/Y44vf;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8BCA21A180E;
	Thu, 26 Nov 2026 16:33:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 605E160558;
	Thu, 26 Nov 2026 16:33:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9A36511E69153;
	Thu, 26 Nov 2026 17:33:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795710827; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zBGQuFJxe18kdVlOV9YSRGcaVRkGKWPeudloXjd0fZw=;
	b=Vn/Y44vfgS+KSGP31KiA4H00pZSfEo9a5GklRnjg7FST77dFe8YlF4hfHY3pB/Ephxen4u
	rvCKp/Wdoo9gYCJCe4fKm6AEzi3AyUNy+zUwOj9NuUxA68We3HNrDZo7w2Yv+pQXw+auk3
	dpi1R6aKC2z4384DX76CxvwsYiOtXU7Hk+JLG5tj/NBuCnD2mGSkKXxUMExK260EheRVce
	GnSMFINMfNRWOvzU7LMcw4rMqfECj0nuAcp1U0jqSAGk0Pxn6egxJ7UKjnk7kwPWUMHEQv
	LN8P+dGMT0BDJHipbc9J0I+LuO/wFel/uDzaOGnK2ol5vkj73JSdGxc/PDjJZw==
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 17:33:44 +0100
Message-Id: <DN5AD0E8NBFJ.2E0I9RWKIMG2J@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <twoerner@gmail.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 0/7] sphinx: carry lexers for the languages the
 manuals show
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20261125154535.3486104-1-twoerner@gmail.com>
In-Reply-To: <20261125154535.3486104-1-twoerner@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Thu, 26 Nov 2026 16:33:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10844

Hi Trevor,

On Wed Nov 25, 2026 at 4:45 PM CET, Trevor Woerner via docs wrote:
> This is the series proposed in [1]: the BitBake lexer first, then the
> other lexers, one patch each. The BitBake lexer is patch 1 and can be
> applied on its own.

For most of the series, the code is unfortunately unreviewable and I don't
think we want to maintain that in the future. While I think there is some
justification in adding lexers (better readability), I also think we could =
aim
for an in-between:

Pygments already has an upstream BitBake lexer (thanks to you). It can cove=
r
most of our existing snippets. For the ones that are failing, we can skip t=
hem
(with a 'text' code-block) until the upstream lexer is fixed. Having our ow=
n
BitBake lexer will not encourage upstream fixes - it will hide those upstre=
am
errors and will rarely lead to an upstream fix.

Patch 4 and 5, however, look like simple lexers, I am fine with keeping the=
m.
For the remaining lexers, I think we can accept that they won't be highligh=
ted
(or highlight them with a similar lexer, if that is possible).

> The series is based on master-next with two of your pending series
> applied, since both also edit the extension list in conf.py:
>
>   - Add support for documentation tags [3]
>   - Add a "Library Functions" section to the ref-manual [4]

Can you rebase on master? These two series won't be merged before M1 anyway=
 as
they require some updates on the Autobuilder.

Thanks,
Antonin
