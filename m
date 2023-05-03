Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C231BC7EE22
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 09:06:18 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.14469.1683104769099480861
 for <docs@lists.yoctoproject.org>;
 Wed, 03 May 2023 02:06:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=CF6wN0A8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-2fa47de5b04so4683321f8f.1
        for <docs@lists.yoctoproject.org>; Wed, 03 May 2023 02:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683104767; x=1685696767;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8LHRcz3XWm/WrypxJKtENVHsWvApLU0kKIVtyugsBiE=;
        b=CF6wN0A8BHm/ONDJpaWMR9SdWplVklzX3H3rApiPmPF5pU529+lu6XjXtMmCszqjZW
         Ll2ZBdeIxBp7TADNJqtyq55ZonyaBbzaabXPFdsdKRvXXCfNFXFKjRZnazRsmiOvegKV
         4mHzE/h510dtEOSlKdPloOPVO3bwvU5ZfJysQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683104767; x=1685696767;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8LHRcz3XWm/WrypxJKtENVHsWvApLU0kKIVtyugsBiE=;
        b=KrZSHQF1vuxddOWcuznCPYu8YDYxWohqC/r70XxRBjhMASSF+2AUPFZZMuJy82ojlM
         PtNHD6odG0T7nQnaVXgCzlLHjZ6xl9PUXSwGcpQP5RLP4Kjifev4VZlVw1kaWZBy6eJI
         tMUwxYUKxCFSoKeWdIuSbNBl6xn0cq5Cqu9/9+pH0le2/VnwxPbvubhUXPTG9yhdnVf0
         lY+MiFX3JCFnvleBiSMMC7q1pg2RSt8WkpH9WSt+d/cxskG/n4B98i+fQsDo3GM8s+25
         1/6nnrnjXjLNtFppZq4FP5cDhgw07cEePua0BouBYbWYpmBlXHnauhhtZ35i7+RoiQyc
         fQLA==
X-Gm-Message-State: AC+VfDy2ZO8p+4khp6JICG4ZKyRSc/G3pbj2Pq+MNeSbxOBF/NSakUw5
	Qg+uRmFiZUjqQflhBWJdLGLq7jG7J1AN7OAVntwZLg==
X-Google-Smtp-Source: ACHHUZ7EhKsVehzGvONAcdYnkHL+j2I6SokNffMcL/ey69Nm4jsU/kLf3TX3DqpnkY9e2xDtKjYEQQ==
X-Received: by 2002:a5d:5222:0:b0:2cf:f01f:ed89 with SMTP id i2-20020a5d5222000000b002cff01fed89mr15428758wra.24.1683104767411;
        Wed, 03 May 2023 02:06:07 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7d60:21e0:c1e5:ef4b? ([2001:8b0:aba:5f3c:7d60:21e0:c1e5:ef4b])
        by smtp.gmail.com with ESMTPSA id y11-20020adfe6cb000000b002f81b4227cesm33403090wrm.19.2023.05.03.02.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 02:06:07 -0700 (PDT)
Message-ID: <7dca973ae4f9f1ee8d5cee4f074044b412371a95.camel@linuxfoundation.org>
Subject: Re: [master] Pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Date: Wed, 03 May 2023 10:06:06 +0100
In-Reply-To: <e9d8e12f-41e7-28a5-4235-7796b8355517@bootlin.com>
References: <e9d8e12f-41e7-28a5-4235-7796b8355517@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 May 2023 09:06:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3896

On Wed, 2023-05-03 at 10:45 +0200, Michael Opdenacker wrote:
> Hi Richard,
>=20
> The following changes since commit dc59b636bb4319a3af552bce84929ddb22a479=
fb:
>=20
>  =C2=A0 ref-manual: variables.rst: document=20
> KERNEL_DANGLING_FEATURES_WARN_ONLY (2023-04-28 10:23:55 +0200)
>=20
> are available in the Git repository at:
>=20
>  =C2=A0 git://git.yoctoproject.org/yocto-docs master-next
>=20
> for you to fetch changes up to d84b771e2ca22fa7dd9525dc515d3972035366eb:
>=20
>  =C2=A0 ref-manual: system-requirements.rst: fix AlmaLinux variable name=
=20
> (2023-05-03 06:05:25 +0200)
>=20
> ----------------------------------------------------------------
> Lee Chee Yang (1):
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 release-notes-4.2: remove/merge duplicate=
s entries
>=20
> Michael Opdenacker (2):
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev-manual: init-manager.rst: add summary
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ref-manual: system-requirements.rst: fix =
AlmaLinux variable name
>=20

Merged, thanks.

Cheers,

Richard

