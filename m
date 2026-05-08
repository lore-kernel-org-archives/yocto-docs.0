Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0451CD342F
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 18:47:25 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1573.1778266040984812097
 for <docs@lists.yoctoproject.org>;
 Fri, 08 May 2026 11:47:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AsSZXgLh;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-899a9f445cbso21341086d6.0
        for <docs@lists.yoctoproject.org>; Fri, 08 May 2026 11:47:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778266040; cv=none;
        d=google.com; s=arc-20240605;
        b=TmEKaqyyx1TsTL77tmpWjSxlM7DCrqacwsNbTW49pN/C9T99hyslTOwG1PBTjYeyoo
         cNDK9ggxsphgsv5QuigdPWBSWTPP6D2iXS9hZk3A4ysA66Uph6q0Ew7lLSaXxqnFBgqQ
         VjrBEUMplFlnj+yFYXy48rCxt1/A5gyMSq0WCmGKjuht6zClnP6NHYbT3fh6l7o8vKIV
         zvCav2Cq0nbbzDQ/3oK6K/+WM8UBqHy80kqfXevzN7AT681Xk82S7+rkmpzYxVkqSqi2
         oIQ17Rd9PoGoPCMOE6IX0mf/Z46tNO3L3FVxiherVDn5xWfoRJxrWfi8nxH7wp5dVETF
         bAHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Nr6p5oYxlAHsBoJ+GFLIhnhtm0us7OQbCsWyo00fo/g=;
        fh=w4udndNa3z3dS987rpA732l9rCEUCMDw7O6T9DWWVD0=;
        b=Tp/qBFHcP4/+Mh7x3lGzf4TwSDJWVzGh0NbugE21yHkFNs3MCPJOc4zXIhj4mVsMsk
         xkZ1KWyL/xZfRhVq1KO34CMufb024KHDgWR45yKaClupyqV7oI323zHRt81WcnliPFRP
         w2Ht12t0chMFd/inz+4Jx4cmWMnOYM9r/6YFNqTtyzefE7r2PaysNsNKH2peBEVS0qZC
         0RDrcB95kqY4XItjloGz/GIn0zPAJVTxU8CTV+6wqboM6VCgeOUPZHxufUmBNyKIJX+u
         lSEag9N6thq4aVEk8UJkC7AZLzGiGhPvrkkDjHui7Zx0/2L8HLRXGgSzjf9uFvcFTF6O
         xiqQ==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778266040; x=1778870840; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Nr6p5oYxlAHsBoJ+GFLIhnhtm0us7OQbCsWyo00fo/g=;
        b=AsSZXgLhYD/nilQK7gKsUqKLrk5Nwa4nyvrjfk5RkY7NaUUA23hhuTFmumb5oo3Mko
         KAIgoiRHUFHeyK968poUI2nNCduR2Tc17IUUQwoJLDkJiob8GWZWrMDPbDSszvATfzit
         WKIOHTFle2zqOauq2Z9QuiDxdBkDB7Nt3Ko+XhZdOx3CC+9ODq9wSUn0ptKZr5IIOyY5
         MmGm8OYrUsXqb4Znpqd35Gz0V0okNkcp+/jfRvdZDIzrXK8Bw+xvacImb7pV/890rCHE
         D9iqUGYKx5jH/Eul436S+NiiclkIe73aEG1HNwNYNW8VbaiE5EG/7omFLGe4qpK2+fY9
         Q5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778266040; x=1778870840;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nr6p5oYxlAHsBoJ+GFLIhnhtm0us7OQbCsWyo00fo/g=;
        b=EP91yYwhifYaQE/tzGAiKdYdUpraGRm+IDK9B1pSqV159ox+NCQwM3myYJxcjt88eG
         KQ8/38EFND9PnarDc2cyn7a+2hbYMo9hzKXbRNEWvFRoMCv5w3y5FrSNvNJamO2BIbth
         8V8uuYZXAvXXC3HfYutUkBcVe7pMovjj6/vLRKTAyzwgGYIdMtrifVEfW5XA/kbBzp0F
         tyWphehGsXt2+f14CGkywZeMLQzunx9imC80gvJ3iMkZ0FJM+skR7x7bgHvBF5HoixNX
         +20jw2GMhuQ8Va8CvHPSSFaceVNu5W0e8ygq4RT+vOuERbKdwQBI/vTu5WmqJBpDvO2y
         0N5A==
X-Gm-Message-State: AOJu0YzbuP/GxwkENGAT08PWH4ajAMnc/pyEC2Iy4K1ACYpBDSjBBc+5
	DkIuBrIm50WngNVr7zgN0PmnU5rPQLDBsyu05J/u1j+58d3xsd0HW/jLmFI9tRMr7sUpZIQtQv5
	qA/vJZmNJ84RmWRmCusyGs183lVjS9dytLDI2
X-Gm-Gg: Acq92OHrEl3Ft8NuIpuPoHYVvx9k4sh9aM1eW77VWzlv2oecjD8JNEqsPubecmQutQG
	q21COeQcaLFu9ZxzWJOtB7x3Jl5+ki1pkU7Gpkowj96GjgY+yaCJaTj8eQICCjxZFx4MOH5v5Io
	dzW/JjimCb7cnf9fTzA6qlHQVec0RN41IGnaOu4M0UtYENzs9YhMruN2AwOYjd3WNWG4D+xmOUJ
	cdG+HfK2l52SCNx0sJGxGh1ZiwocKxIfaN+Icb69Sx2JpJI/vwiJaOrRgFREFi+k6//zisATU4T
	N7shzBs3w5Qvoh7Uv/ykeOX2zIUzWnbjlAg3hUG8oA==
X-Received: by 2002:a05:6214:2688:b0:8ac:73e8:af42 with SMTP id
 6a1803df08f44-8bf412ff41cmr67878246d6.4.1778266039899; Fri, 08 May 2026
 11:47:19 -0700 (PDT)
MIME-Version: 1.0
References: <e9ecc3f8-c93c-caf1-eb73-de73633cda10@crashcourse.ca>
In-Reply-To: <e9ecc3f8-c93c-caf1-eb73-de73633cda10@crashcourse.ca>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 8 May 2026 20:47:08 +0200
X-Gm-Features: AVHnY4JXpQqTcWJSytE_zFLpaBLNxgVLv75cDDDIcn_BwZtw9qKK3abWeEVrMH8
Message-ID: <CANNYZj8TrFArNqiE2uTowv5RvnourbGoweJ_ySDXmjFKsx=P2w@mail.gmail.com>
Subject: Re: [docs] Quick Build using word "naive" sounds a bit condescending
To: rpjday@crashcourse.ca
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 08 May 2026 18:47:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9418

On Fri, 8 May 2026 at 20:37, Robert P. J. Day via
lists.yoctoproject.org <rpjday=crashcourse.ca@lists.yoctoproject.org>
wrote:
>
>
> https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html
>
> "If you are not in an interactive shell, dpkg-reconfigure will not
> work as expected. To add the locale you will need to edit
> /etc/locale.gen file to add/uncomment the en_US.UTF-8 locale. A naive
>                                                                 ^^^^^
> way to do this as root is:"
>
>   Can we not find a slightly less patronizing word? What is this
> trying to say?

TBH, I would remove both notes, they just seem outdated and not helpful.

This whole Debian-specific section is also duplicated in the reference
manual, so the quickstart should simply defer to that:
https://docs.yoctoproject.org/ref-manual/system-requirements.html#required-packages-for-the-build-host

Alex

