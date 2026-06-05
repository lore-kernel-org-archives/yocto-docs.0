Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5513ECD6E6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 21:56:03 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5600.1780696553509490588
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Jun 2026 14:55:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qB1IFxdv;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490b2b037d2so20954275e9.3
        for <docs@lists.yoctoproject.org>; Fri, 05 Jun 2026 14:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780696552; x=1781301352; darn=lists.yoctoproject.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8fE4WOL82VyYwDd7n1FTEjv0ctZBR3QFXtMTda9sjiY=;
        b=qB1IFxdvkhKhX2CaelzHpZeQCRK5hWBY1c+mO/+62kiYT4o/DqamygCmqPQxOs5VYk
         QxioQMvh1HFlqNIqf+ZTxRVftg/0uLHzCItDLxzOUIWRI+YVA1+frXED7/oMJ0qgFCu1
         kb1oKtHZGnxP3GtSS/zqbVCl999BUmZJLeRKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780696552; x=1781301352;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8fE4WOL82VyYwDd7n1FTEjv0ctZBR3QFXtMTda9sjiY=;
        b=iWn2a8HeaeGg3+qr7Ivtsm8j/MgmVdns6A9LFwCuJkYuI30/zqhjsiA1V8Io0HbmZS
         jMM4ZzxHcW+IqPiIXbx5UOZfGuI3jTBtB8tStmF6Q7rDW298tuQOL6kRdmg+hd3pUGyJ
         THqYpdnKZevjHKbsbvcjr7eA5N+QdzE8ypzIhfgnjPfpJyst+O4PsckfdZZHHrLNw+ut
         GnpxD7gOKLvTm8RVyf+enWhL4wQFU+dO3ZD8kPJmjn5ZXpipcrMHpgpKMVIYWsu5ULFZ
         biyJddiBD/CGc4QbUc77CrnxdGIBN08FYDT5JhImaUXbK2bTZvGzgsW1aJq9cpZON/Zo
         pP4Q==
X-Forwarded-Encrypted: i=1; AFNElJ/2IWo6GuqPPtbTyuYd/aAWRXRIBEqJEs8CihqmZVzdbbhY9UV6HvIKa9bv9UQGkD7XYoxU@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwwUTHvp4h1gEcndCPKAqj/zFuZndyWdg842EUO49oomiaJSXsw
	5RG0HkrxRwtMSJSxuEUgFar8dAoNT5LsAAe30Lxvdz4pYGhRQkDNNpnC2lBeo4Ee/C0=
X-Gm-Gg: Acq92OGrNNHrqsVQb8INKwLxpaoYv2ElQvwY1KM+szbqYBRANS8Cp5smtzRfGG294hY
	Rbyal2zn5HyM1IwiYzc+8crUJYRdkEW2JGkkmh14YHXZKqqjU+E49UPaLYw9+sqFVN2DgVNkWXF
	7ejLNfGkKTbSckGoza3kC5lBck/AiVtZ7aN3O4z0BFwr/eae1J57pTpDbWW3g7TtTm7E5I87po/
	2p1cwjx1UtPUj+h95IXYBUI9tVM9MAuIUtYGmZTUDtfzmhVKiJaJxXjmXJrmy5ZgKxbaMTWzx77
	SFdeDsJOU6PF4yB/tI2ONp87TuWYJqjw3ES7DiWNS7VWzjBF339twDaktctM5m6U0gkPek2suK+
	To7r1SQpcA4ivXdjhb7Vw2Vw9zXIYnfjV5HFCnVtsSCU8uBg5h1IvW1Zk7wLx8tKtpZ26wkE3GH
	vVEmm4i5Oj6US+pwhdqy54a16Mv+srCrTAu7C9l4J5RoqMt+OEJtsPdhhBflsYqMGKpHYgvNcV+
	iBXbR/jCfHdrdloFAGMRahXvdY=
X-Received: by 2002:a05:600c:8b35:b0:490:c08b:b24b with SMTP id 5b1f17b1804b1-490c26131c0mr84299425e9.26.1780696551851;
        Fri, 05 Jun 2026 14:55:51 -0700 (PDT)
Received: from localhost (2a01cb001331aa00b3e1ccc1be2b2798.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:b3e1:ccc1:be2b:2798])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm30523265f8f.20.2026.06.05.14.55.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 14:55:50 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Jun 2026 23:55:50 +0200
Message-Id: <DJ1G8TYU29O5.3UOXLB4S0H9RB@smile.fr>
To: <antonin.godard@bootlin.com>, <chee.yang.lee@intel.com>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] migration-guide: add release notes for 5.0.18
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260605102453.2102163-1-chee.yang.lee@intel.com>
 <DJ16III1L1GN.2O92K0NWMB5RE@bootlin.com>
In-Reply-To: <DJ16III1L1GN.2O92K0NWMB5RE@bootlin.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Jun 2026 21:56:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9623

On Fri Jun 5, 2026 at 4:18 PM CEST, Antonin Godard via lists.yoctoproject.o=
rg wrote:
> Hi,
>
> How are there so many new CVE status updates for the kernel? Is it linked=
 to a
> recent change on Scarthgap? Could we mention it in the release notes? Thi=
s seems
> a bit out of the ordinary.

I think this is linked to
linux/generate-cve-exclusions: backport script from master branch
https://git.openembedded.org/openembedded-core/commit/?h=3Dscarthgap&id=3D6=
6a13f93403533b95ed27eed24931aa310f8ce79
linux-yocto/6.6: update CVE exclusions (6.6.123)
https://git.openembedded.org/openembedded-core/commit/?h=3Dscarthgap&id=3D4=
bdf5345c32c9e294a64d61af49ce2adabdaf1db

Basically, the cve exclusion list jumped from 6.6.32 to 6.6.123 in one
commit.

>
> Antonin


--=20
Yoann Congal
Smile ECS


