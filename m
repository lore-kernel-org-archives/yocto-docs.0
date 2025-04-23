Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D25D3C369D7
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 16:32:28 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.200.1745425945030407087
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Apr 2025 09:32:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ASwx/mjp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.43, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so6764563e87.1
        for <docs@lists.yoctoproject.org>; Wed, 23 Apr 2025 09:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745425943; x=1746030743; darn=lists.yoctoproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hWAWCCoSTWgE7uArBMVPCGRaRuuHqFbl6G6+s1ezmxI=;
        b=ASwx/mjppjNJd75Yo+DnPiMBPh3zHgCCKISCePJrNoUwlWrCAymbMAEs/tAr7dwGQA
         bc1XvdyEOkbjNsjGGwwOFq4bH/J4lL62NZf1U6iPTtMaVhNnZMcZZ8hn+qdqrz6/xbeq
         j+zFTUGG9Ik9N3nLhzlDqhAPcx2Rdp5vxTPdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745425943; x=1746030743;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hWAWCCoSTWgE7uArBMVPCGRaRuuHqFbl6G6+s1ezmxI=;
        b=NHgPmaiOUFAOS8vMIpD3CvgESRYB9ZDrtFKj0qZC2rsfS7lfiWb7GhokuSrjXnxVJO
         ZjrAaPM8lZFEex2OZP46xMsTT8dU37J4xHjRedi0TxrU7KAQAjnf8G+uGN0qfWr7O+ai
         SkGjW67YdFskwfcBwQgFQd63tV3ixXg/UtokfZ9xcj7EGetjDo9GyJgD4+JslP/XfpkO
         DjapSne+2NEQjnTQskMHBvb9W/+AjkrJI+sTO52iPVcxLslIZnxWnfWxZBZcy9/elbUI
         /ZTRr91nfcdUM/UTjvFryVHx2rtR8tLyDb9sUGaqJJeqv0obajAF4Xz9qh5EbYtcL9uy
         qUvA==
X-Forwarded-Encrypted: i=1; AJvYcCVnss+nR5lSQL6yUpCrpP0Y2HkwBoutW3p4mWXQcmRg3FQoG7gkcp8Y3v7CuG0qFR+X2ORI@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzupJ/MUTPk0zkXobRJ0yc6N4QWdBeKUz85vkx2npFWQSyhAoZ6
	pNAEZHC5D944cg3kNWrmzsKJdoNRNEuflpwhuXNIBYTGvWaZMv5x9aGr5hE8vdo8Jk3YjdWJZoS
	375MepF53Gi2wGn+9TTqsojHt3Y2/b71RaGpy6+mc2ZjY2/Yl9XtquA==
X-Gm-Gg: ASbGncubILRlJT+u4LagZIYUimDqUVe406tpTpF+lL/WjqrZdZJxtZFAmUe39skZ38o
	s3bdHM/dG1Be21m6rlX5Ym1uSJusvsG11w+Bt5KbQB3Nv8/vdLg3T0XYTY4eRX82xs/V6BcsLrM
	C1wjgu/x6khsYqufXNc7bPKok9mQXX7f8etw==
X-Google-Smtp-Source: AGHT+IEsLO5qDH52jtW95VXHp/Kjh/gk1fLmgPzPaOVf5A6sYp86JbaHuBl9t5LrxgoWgFNRwSdPdqW/G2/EUY532H0=
X-Received: by 2002:a05:6512:3f2a:b0:549:7d70:52a9 with SMTP id
 2adb3069b0e04-54d6e66d436mr5509837e87.47.1745425942604; Wed, 23 Apr 2025
 09:32:22 -0700 (PDT)
MIME-Version: 1.0
From: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Wed, 23 Apr 2025 09:32:10 -0700
X-Gm-Features: ATxdqUEcpWBbhYUW6VX7ukl73JV9rrQ7F-AR3Q2Z6WHx35_L-zp7WVKvA97JxfU
Message-ID: <CADfgfoa_TOYvKDCS4pitz=PCw2V1zchLB2ZiKkifsQ81+ZGQCw@mail.gmail.com>
Subject: yocto-docs tag corrections: kirkstone-4.0.26 and yocto-4.0.26
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000004a8ccf063374a50d"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 23 Apr 2025 16:32:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6778

--0000000000004a8ccf063374a50d
Content-Type: text/plain; charset="UTF-8"

During the recent 4.0.26 release yocto-docs commit
e61630ba2e4e865b57e920171a62824a4eba6533 was tagged. This was incorrect and
has been replaced with new tags on
commit 9b4c36f7b02dd4bedfec90206744a1e90e37733c.

Please ensure any copies of yocto-docs have the new corrected tags. The
following command should fetch the corrected tags.

git fetch --force https://git.yoctoproject.org/yocto-docs yocto-4.0.26
kirkstone-4.0.26



-- 
Michael Halstead
Linux Foundation / Yocto Project
Systems Operations Engineer

--0000000000004a8ccf063374a50d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>During the recent 4.0.26 release yocto-docs commit e6=
1630ba2e4e865b57e920171a62824a4eba6533 was tagged. This was incorrect and h=
as been replaced with new tags on commit=C2=A09b4c36f7b02dd4bedfec90206744a=
1e90e37733c.</div><div><br></div><div>Please ensure any copies of yocto-doc=
s have the new corrected tags. The following command should fetch the corre=
cted tags.</div><div><br></div><div>git fetch --force <a href=3D"https://gi=
t.yoctoproject.org/yocto-docs">https://git.yoctoproject.org/yocto-docs</a> =
yocto-4.0.26 kirkstone-4.0.26</div><div><br></div><div><br></div><div><br><=
/div><span class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" =
class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"lt=
r">Michael Halstead<div>Linux Foundation / Yocto Project</div><div>Systems =
Operations Engineer</div></div></div></div>

--0000000000004a8ccf063374a50d--

