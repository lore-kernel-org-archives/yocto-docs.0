Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF137CCF9E9
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 10:30:26 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.3503.1761733823123720340
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Oct 2025 03:30:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b7vWkdw1;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-87d8fa51993so82469946d6.1
        for <docs@lists.yoctoproject.org>; Wed, 29 Oct 2025 03:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761733822; x=1762338622; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DrEHPz9eqFsM0m0kjy8DEc6LShFFpylVbVuSie2HOc0=;
        b=b7vWkdw1OGu6V2RtfaIw460Yd0azOLQG1t/34SuWKzLj1vZegutCsKxkJ7+Pxj6Xql
         pNCITryWwfpCrCSJIVUeY985lpGguLus1HDwlBqR/nBOGZ3y+IR1qPGHQPeRTscDpBiM
         azBwvR/+Sw8P2MjHgPcflTI/SpHKEGwFRe+fOrxK/LWjegtTE40gaDWlDitM+sDv89GR
         TXPXeXuYFBn6mwE8AHwkxtbylWFKsBYb1xBSNVsf1v2NnCecI6cd/0V+fCo/3sQttJeA
         9qV8bWFiiFrPlIlIgWZqcIJm1pXn0h3CXmLbM/7fnd3sfMnx8TBPmKz0I+Z5nxMJaniQ
         iG0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761733822; x=1762338622;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DrEHPz9eqFsM0m0kjy8DEc6LShFFpylVbVuSie2HOc0=;
        b=cwnI4hKDSKZLV0yo2LihTmL8iBQYyYg9zjszOy2DFg0RedkFX8CO8TSvZlyIw9Jpv4
         ROiwSaMDgQzlJRRb/abh3kOngK4I40mCKTnPEsFyPP53YiG3abvLMST+pQKa91dVTW/Z
         qtrs8FiqxsqagXX4GXWpuJ+xSg76etc4GbLhT5cZGh7Z+6mAHNSp7jEoaStqdWT1mehE
         8iVMwxdDBK4bkSw1/303TLh5doCWLM5RsJK/kcWw0iI7Yfza2b0aM4l+XbY/TVqxp7Re
         S0o+QXT3FAOpwCs2nnKt6STb2Hsbkl9XlXkeMFotPLECdrdABTqM+AiHjVVVByzAK3EH
         NCxQ==
X-Gm-Message-State: AOJu0YxzTt8OKFEdAbR5oJMHVzRkoTSOnagRmr9z2irLl3czuxXkHC5F
	rmLIEwMVftR5AUjHZxOU08yzkvUNPjSkbKnNhRM+8FqbtYmGR8BmseZTDLvioohuzIZSIFoH4p5
	YVO4h8wSQA601yVtjBe/zdZmbyeNSBxA=
X-Gm-Gg: ASbGnct+gUSIGUI8+qxlcQdlA7sa7afPvaATNVOfrdo4ZoIituAfKJ54toJ/AARx3bv
	1+NlybQrfN0o7MsxHN0dAUO+Ym425wl7k/rj+c7Uhdr64m5Tt78CT1kwJwTQhKK/ZS5G1ujdL8b
	sEiE8aSR6EZONiuqR9ayg8Ec3vXukxyTMR6dgNJANaJNnEzvkMwE2VQp+mAcDbs98EGsoP5nh7I
	vNAoZJRcGJru0FYDEZsmhHJ2Xh7iMu6qvjwE6L9aDwCACKbSVShUAuRtlJgYnMFsdSbApewC857
	hoAUNRAcqL5d5xT7FuKlD7UQaepjuYiK2s+qwDNzZ2L26DBwpqMe1hHEL2md9dZzzlsAk2HpidA
	P8MHg1ngrKFrb+neDrhW91HlTkM8g
X-Google-Smtp-Source: AGHT+IFNpMeEXI/BCWT3LTRzUCimitffdSnAxc1Fa917nUJq6TxPlwl88pvTynu2FKaAp+XSa8gKarBb38nJzLe7Z+s=
X-Received: by 2002:a05:6214:2122:b0:87c:22af:e987 with SMTP id
 6a1803df08f44-88009bfaebdmr30702446d6.48.1761733822079; Wed, 29 Oct 2025
 03:30:22 -0700 (PDT)
MIME-Version: 1.0
References: <8bc6e10f-f341-b615-e4e7-fdafe0905ec7@crashcourse.ca>
In-Reply-To: <8bc6e10f-f341-b615-e4e7-fdafe0905ec7@crashcourse.ca>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 29 Oct 2025 11:30:10 +0100
X-Gm-Features: AWmQ_bn86Puaxh-VhIXE8MOoN_a5LfdPoQcb85oGkZ_O6dfRpx4BnUUm00443EE
Message-ID: <CANNYZj8cGtxi7s_mhFQ57HQc11sggUmRriBF1cPGGgyDETeUCg@mail.gmail.com>
Subject: Re: [docs] should section on "Unpacking Code" not mention UNPACKDIR?
To: rpjday@crashcourse.ca
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 29 Oct 2025 10:30:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7896

On Wed, 29 Oct 2025 at 11:06, Robert P. J. Day via
lists.yoctoproject.org <rpjday=crashcourse.ca@lists.yoctoproject.org>
wrote:
> here:
>
> https://docs.yoctoproject.org/dev-manual/new-recipe.html#unpacking-code
>
> there is no mention of UNPACKDIR. is that deliberate? does the reader,
> at this point, not need to know about those underlying details?

Maybe not. The defaults for S and UNPACKDIR are set such that it works
for git checkouts, and almost all tarballs. And if doesn't work, then
the reader needs to know only about S, perhaps saying what the default
value of it (from bitbake.conf) would be useful though.

Alex

