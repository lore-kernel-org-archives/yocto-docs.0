Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8AFCC3ABC6
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 08:05:31 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.3495.1746605129942155558
 for <docs@lists.yoctoproject.org>;
 Wed, 07 May 2025 01:05:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZjP9W6vA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39129fc51f8so4398280f8f.0
        for <docs@lists.yoctoproject.org>; Wed, 07 May 2025 01:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746605128; x=1747209928; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Day+EK2xEDEhSzQ81X2qNA2flrsfzHM2rDpR7hSvd9s=;
        b=ZjP9W6vAJeWIlazWyZzK+sy2ZSh/R1q4fiaiEprbbU/LNEU82h+Bctt9P0f8TmFOH3
         Omb6L/XgFSJvUtI6Dg9lQavNN4Et0yaeKoc9YL4QCLm5xFS8IonVTDuBk55aSlaU4ctd
         OsvvrdQhZCNVKdkRaOdQ8Ab5W1yF4vMc+PYGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746605128; x=1747209928;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Day+EK2xEDEhSzQ81X2qNA2flrsfzHM2rDpR7hSvd9s=;
        b=wVzxiURCmqjqGsiuMRndEkxyCWqy0lvCQ/lvIPO/canNmmmKeGMoDnm3/TESdvYs+N
         S6SlTcFXd/zzXa5dpMpHuER5b2ExPNgftmrtOGqDmRMoVksHKYblbrx6QFnXO9WGcOMm
         AGPGFKzd0nqlcjbNv38zxE/+D8A6DXz/tJqcPm4JPz4ouHGj0AGyae22l1y8orW0FTJ2
         MUyd+U+a52FNuPmPKuYoIf4ihIfnRNEkU67cleSN3v6zBkTLva249CExQxfyr+L1az+J
         DfsWQ7wPEnf2RYQeyaoQGIQN3fxv1lBubyGCSSoZ6GnzpDIDdu2V16FnJ0FSGJfCx1/d
         h6Ww==
X-Forwarded-Encrypted: i=1; AJvYcCWJykNsfql1v6ibYfUz91hokxgnAj0Jfs+J7dadz2PqQO42zRjXG+9cYhu2veOk4ZBhQSCC@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwZTkWGfvR0Bj9Wkgee41tfwVA+uPWc/WF+ZGPw18x4OQls2wxV
	+41CkQnZ85ZHcPrFgnrJzvM6nvILWzsE/qhzy2dmgLNEHLg+PFRIjVbBNsAjgGM=
X-Gm-Gg: ASbGncu+8oyLZYisD3act4gyAU9V/PDOw0CTrMvdwa05afwNerSZdEypqX+QYywRKjN
	1PA0s1iZpFFRqBcOLJDm7f5b+Lrx/+1okQ4oNw6DEfXgzfT7Ikt04p/0/S2KVa0gA2jRKzgd4RC
	5/SDm+Ye09XLl6thga+OAwYIiuRpw/GYDo1OZk+7Yjh8k/xQfmOsvL5vEefnHSqqUQXg6/iy+ia
	+i6AOywDfki5RDima+p6h3XLlPn57AWpcOTEtQKaPTSFZ2bv9x3EqALbgfjVLE1l+1eIbvhoWf/
	TeRGjUduYEfS4AxS9V3W9oRGa41ELNcV/7Ct4OJoO60nAupWgo6BcnmSD3Ttb0bpZ8S75sDxA9j
	IdV2MhH/jm1f6fwbZGiGSbZj9HcQmSlVg7mDHMA==
X-Google-Smtp-Source: AGHT+IFE72pwQieGQRgLZdRNuYF1DuXO0AcvLeF+NBHTqy0VF5euV+m1ozYJA2zIbDd/LKpSsH3bEg==
X-Received: by 2002:a5d:64e8:0:b0:39c:1257:ccae with SMTP id ffacd0b85a97d-3a0b4a1c722mr1756042f8f.57.1746605127753;
        Wed, 07 May 2025 01:05:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:12c3:1543:c9e5:5d2? ([2001:8b0:aba:5f3c:12c3:1543:c9e5:5d2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b0ffb1sm16026375f8f.73.2025.05.07.01.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 01:05:26 -0700 (PDT)
Message-ID: <4ea9b9dcda4e5482050f472b03b69bdaf062d532.camel@linuxfoundation.org>
Subject: Re: [bitbake-devel] [PATCH] bitbake: fetch: Add support for
 remapping URL's
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sawas Etairidis <setairidis@gmail.com>
Cc: bitbake-devel@lists.openembedded.org, docs@lists.yoctoproject.org, 
 Savvas Etairidis <falital@hotmail.com>
Date: Wed, 07 May 2025 09:05:26 +0100
In-Reply-To: <CAKJXz6d061e5h-_7vV6iWVj90gFvKqnKC=yRQqWaobqjvzfLgg@mail.gmail.com>
References: <20250505185755.1952-1-falital@hotmail.com>
	 <292ee69d270d71860a7ebada65e4f6aeeca01d13.camel@linuxfoundation.org>
	 <CAKJXz6d061e5h-_7vV6iWVj90gFvKqnKC=yRQqWaobqjvzfLgg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 07 May 2025 08:05:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6801

Hi Savvas,

On Wed, 2025-05-07 at 09:28 +0200, Sawas Etairidis wrote:
> I think it would be better to not modify how PREMIRRORS and MIRRORS
> work since users already depend on them and expect them to work on
> specific way.
> Like this you can add extra rules to rewrite the source code url and
> then use=C2=A0 PREMIRRORS and MIRRORS if they exists.
> I could instead provide an example how someone could have the same
> result using PREMIRRORS if you think it is not worth having this as
> standalone feature.

Looking at the bug in question
(https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10699), the issue is
filed against the layer index and the issue in question was more about
allowing layers to list their mirror urls so that we could canonicalise
different urls.

Your patch is against bitbake itself and it is unclear if we need that
support in bitbake itself to solve that bug which was targetting a
layer index change if I understand correctly.

There is already some discussion about changing the way
PREMIRRORS/MIRRORS work for other issues and given that, I'm reluctant
to add new code paths that add complexity and do things in a different
way. I've been hoping rather than adding complexity, we could try and
simplify whilst still maintaining the different use cases we need.

Cheers,

Richard

