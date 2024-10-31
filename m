Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42645D767D6
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 14:18:58 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.13590.1730384330388632871
 for <docs@lists.yoctoproject.org>;
 Thu, 31 Oct 2024 07:18:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cMtD0/br;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4315e62afe0so8646395e9.1
        for <docs@lists.yoctoproject.org>; Thu, 31 Oct 2024 07:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1730384329; x=1730989129; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZpP4H6h979XK2KspmEcYxx6FgKdWFXkopn+gytBfH9s=;
        b=cMtD0/brT24O0QSpvwZDv8gQy8W4twohChRSB+4c8lrVTEw/hLTxX8hmOZ+6m0afsg
         E4MzoAhSOr16/r56KzqTpI/ofusumzFAvVtlUKlIMRzFZ3JsAXNA5RIAfV95NzWocVqu
         sGS55PDWBVti+IZz+gQ7/G5/72YapnJwkGO9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730384329; x=1730989129;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZpP4H6h979XK2KspmEcYxx6FgKdWFXkopn+gytBfH9s=;
        b=F97Qtse0DCxrkjM0pSCIjjLuN2uk6opUaRkY0/TkHiECi1n0NiN//qLRA15MkhtoIW
         RDd32+CK/hgGG7VejKE6XmwspT6XSmPNO7osz5VbEcFwLTwmP5a8M11kbyVnSn51YlOS
         D+x2FENbqLXFLmr52V54P8atlJCp0TKC0tKTsoreX4afKITVI8D8XXutBLBD18/HFyU/
         u61raWNZmxQuBOTC2YvdOySSaTXTCjiX78ET5MajzXxZpGawmb5eayhXeixlFVALJdq9
         DEalsHUWjBloLZ3l6eDJSMrYwabM4w3bYPToKDZ8p0N99egoqibalxJv+kar0N/BjW+6
         tS5A==
X-Gm-Message-State: AOJu0YzXq1P/ExEvfgs6TOtLV5HY5siVRWZUvEUYplyDZp3sWNmdllwq
	qUOelUNM2dguDhIU5w01lsSBsKUiYiFoG1qELsVxXdWuE6W0Tx2gAqldxzBIeiw=
X-Google-Smtp-Source: AGHT+IEquSDWaQyuqjGq7ACeOyNj1rF6kBWLL7HpwxV5E642yGqH+9iKXQsWpY+c8aKT6rGVZJqeQg==
X-Received: by 2002:a05:600c:1d15:b0:431:55bf:feb with SMTP id 5b1f17b1804b1-4319ad0899dmr176706735e9.25.1730384328818;
        Thu, 31 Oct 2024 07:18:48 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3ee1:1135:b938:d59c? ([2001:8b0:aba:5f3c:3ee1:1135:b938:d59c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5ab31bsm27428515e9.2.2024.10.31.07.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 07:18:48 -0700 (PDT)
Message-ID: <12c807fe6d207545ca47f1ca32ac3ac8a21329bd.camel@linuxfoundation.org>
Subject: Re: [yocto-patches] [yocto-autobuilder-helper] [PATCH 2/2]
 scripts/run-docs-build: Add support for multiple buildtools and add
 modified 5.1 option
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: yocto-patches@lists.yoctoproject.org
Cc: docs@lists.yoctoproject.org
Date: Thu, 31 Oct 2024 14:18:47 +0000
In-Reply-To: <18038F2FA57C7978.6352@lists.yoctoproject.org>
References: <20241031141512.544354-1-richard.purdie@linuxfoundation.org>
	 <18038F2FA57C7978.6352@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 31 Oct 2024 14:18:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5634

On Thu, 2024-10-31 at 14:15 +0000, Richard Purdie via
lists.yoctoproject.org wrote:
> Add a modified 5.1 buildtools tarball for docs builds which has
> support for svg -> png
> conversion using rsvg-convert.
>=20
> Older releases need older docs buildtools. Add support for this in
> the build
> script for docs, installing both and choosing depending on how old
> the main
> release branch is. For now I've put the changeover at scarthgap, it
> may be
> possible to make it older. I know kirkstone fails with the new tools.
>=20
> Bitbake doesn't need this since it's docs work fine with both
> versions.
>=20
> The actual docs build is done in a subshell so we can choose the
> environment.
> We may need to improve the selection logic in future since some
> branches may
> start to build with the newer tools after backports.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Just to be clear, the new docs buildtools includes the latest sphinx so
this lets us start moving to new spinx versions while at the same time
being able to build our older docs. We've wanted to do that for a
while.

Cheers,

Richard

