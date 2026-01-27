Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED9ED2D8FA
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 10:50:18 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7746.1769511017903287958
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 02:50:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g7nTZ7Kb;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-894774491deso87362916d6.2
        for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 02:50:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769511017; cv=none;
        d=google.com; s=arc-20240605;
        b=dCIhDAJmXhDWjcYnt1aJwwz4SS8GDA4KGndRvehSUSFA6VhquVASlnNDFztThaWgmx
         GDJsgT/oLT527eliJECIDc9VoBiCEGu92lMkPauDCpDLXCYBKn/eZsHiUwEUbP87m96K
         T9bHgtkMROYL2z15re1qtUOy6vGNdziE35ilZo/Vqd5s8kszmxR5qo5ERT2AOAkomJMu
         Hx4HvplwaBpzHg5QiYx8w5R72k0kceAXHCYDnGQrG5thW4DfEZ5P/KoyHi+ffeDgQOzK
         hmdn7vZLyUmBP4qXlva8N1bQnVIW+5tCp9izoQA3cEFV9ujL7D9CQI9KIangL9MbKU1i
         l3Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IO2wfGzQCjUd+XEsY9JwDYHRPGLkCN0Yc45qk4bQrTo=;
        fh=36D3yXw7DiYrAtJqIuUnQoXzzhiSGApXOVOZfxOj9/A=;
        b=j85yGrj1L7BLkvl+FvFk7fAsJkND106K8Z5cHEQw9lr5El8pqyOE5Q/md/TJX58+JP
         FAsPUNQgyMTgGJ+pqfQ0aJL+eI/WaNhvhQkzq6sM3bWSy8VLI9zNYcmOh2H8mGKMZiv4
         dhH0Yx4h144lk1a0ZqJBkRlUaEJttUbdZPxdb7Wrz5XqNvDodZEBZWo0eYNDb1tKQP/g
         brAozyhwNzqSqOEGt2Dr+t6MccezkQhtOzRn6xwRk6Gq7p9AJq7yz3hy4LfEo0cF47Jt
         pPBwpte9jR5mFisRMXUGGgpZBOzrRfUsDEHuPZJGWKt5m9UAkr6JkXPEUWcr+IOQzn1O
         +8aQ==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769511017; x=1770115817; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IO2wfGzQCjUd+XEsY9JwDYHRPGLkCN0Yc45qk4bQrTo=;
        b=g7nTZ7Kb03prbUu8W5SJcsfAUWOSqMRUa1ORHNjvm8K292FGKroeTNMaL+YMEPw9p0
         yimJ/JQSUqfxy5ePv81StC1ahKd4UB9FHc3Pw2WvWPkwtAFmCgWLsgIwQogUa7upuDJw
         hXhuWyaTSkqinqsV0YgAUNAEsrBXl4hnrLXRQZwTalhe106a0kPa29uPbi42++RogAHb
         BzrSimqQqNi7fp0Sa1TvkAAnBJb4n1ILKDeozZnvP919G2BI6OOwpZaerqz+ZwLxOCLZ
         s7AqR0h/GAiWDD7fDqhag4cTR3q9lcTSTTKvdTLqmbY/bFoOF01FPaCpWUL8Pw7p/ebA
         gV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769511017; x=1770115817;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IO2wfGzQCjUd+XEsY9JwDYHRPGLkCN0Yc45qk4bQrTo=;
        b=Rj+RLTX2BVkvGhfpVtwfMbKNnmOpFetQok3lH9TgIaKzOGZ9W9eQBuQYFbi6FJUpgS
         W1gkcoGQgizVp8maH5EWlc09Lsy/6W8q1scfFpdz4vrf4+lTnF4lEte2zzcY2gCc5CFr
         L2mumm5ZW7pcg488D+Ate8mun+FVjrVRq5awB28mn1xWN5N9IFfyGDNsh888kot9bua7
         TvVk/wgqlmeH9TcGF8PxSGZTEz8jmF8sb5q35l9SM/+RwspKC/E4F7UOw77TSGJphpna
         JbypKNfEN2ifzBp8Vjy9hgDeNI/93cQhqYvC/+Ew0xeO/rHNamxFWwu3hbUXG3ZlWOsk
         C4tA==
X-Forwarded-Encrypted: i=1; AJvYcCVWiel9ml3Sr1RRGmHKaWK0QQMrgBzhybsEJCmU4LQ+vN1rl991epyySRiYrHxj7Xo1yBJe@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzXQxcMbtf6f8Kjh9N3IYJxrBUd26p80NFYfAZGJjIrp8iQvjFc
	l3TNkb78IUE0CYUVLf+MnpHsUFRbEY4KhWjQm82aZUz3VF0U/c6LpU8LK824eA9dqrsf4vQ1Bqh
	MiLVQYRAdllxzeaDWY6Xo1ZEnnhRWHiw=
X-Gm-Gg: AZuq6aJS6mJzss+1sDGpovAuPrIpBVVwrhSgdbWH/jZMd57fEZxeprau/q/AvjGIScd
	+YoQpNdfXxOaVQy6a5rSiKJEubmtNwNE2iz7PyKfsr7blteHBtAW/OT6LcOrqzk6ZnvviHQbq11
	WIoIfOYjarp45KPPdZHXpYkJex2DLDSPNevfyyTQlzHPL6SzuJzji3++6b3QfhR/1ox5VCmM2ZM
	GPkSs1bcKIrNHyhS3XjR5vpd8eFcW+9BoVyH8vPGgtob4EbiaR7YDU5EViPNlJGJAjGJRECNKjX
	cVufCLpJ+W8RCHv5lSE/DQg2OuFmpg==
X-Received: by 2002:a05:6214:23cd:b0:894:3cb5:2ed9 with SMTP id
 6a1803df08f44-894cc7b9cf8mr14829916d6.14.1769511016825; Tue, 27 Jan 2026
 02:50:16 -0800 (PST)
MIME-Version: 1.0
References: <20260126222743.411405-1-daiane.angolini@foundries.io>
 <20260126222743.411405-5-daiane.angolini@foundries.io> <DFZAULAJWR0S.1RQ0LXOE4BSUR@bootlin.com>
In-Reply-To: <DFZAULAJWR0S.1RQ0LXOE4BSUR@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 Jan 2026 11:50:06 +0100
X-Gm-Features: AZwV_Qjrte7R68dz6zv2IKQ0Bb3tjZBb04BwVQu6m76ZrxkhBd11e1etTVZvFks
Message-ID: <CANNYZj_Y1JiRoXK3iW2mwe1Cvga95icXtx3FzByfBzRs4upMuQ@mail.gmail.com>
Subject: Re: [bitbake-devel] [docs][PATCH 5/5] docs: Fix sources as required
To: antonin.godard@bootlin.com
Cc: daiane.angolini@foundries.io, bitbake-devel@lists.openembedded.org, 
	docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 10:50:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8728

On Tue, 27 Jan 2026 at 11:28, Antonin Godard via
lists.yoctoproject.org
<antonin.godard=bootlin.com@lists.yoctoproject.org> wrote:
> > +   under ``layers/`` directory of a :term:`Setup`. Although the list of sources
> > +   can be very flexible, at least BitBake should be cloned to generate a
> > +   :term:`Setup`.

Not necessarily. It's an esoteric example, but one could write a list
of sources without bitbake in it, and leave 'configurations' empty. In
this case bitbake-setup will clone/unpack the sources and stop there.

Alex

