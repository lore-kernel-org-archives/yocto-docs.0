Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D8F2CA0FED
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 10:16:16 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.17936.1757067366168622473
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Sep 2025 03:16:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KXfJ8mxE;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-726549f81a6so20785736d6.2
        for <docs@lists.yoctoproject.org>; Fri, 05 Sep 2025 03:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757067365; x=1757672165; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=upTwZKyiBNnC+OkjgBwo72rjaO0JALTLkZu8FhzInpo=;
        b=KXfJ8mxEyw/KqnWQ/JV5ZnjmssbACJ82LOzRqqW2yVpgVhRQ+TwSrBjb/Lr8EozWTB
         NGKtEGCbu0BP6g+9OG0eNbuIDMVQfdKEOpH1u6TxybDe6OGgYnkJWyW1K7wuIYPawJYJ
         ZozIZ6N+FHmxYFVWb50TwQtpGflYwc31yN1Xc9FB3hB80Y+GOK4NBzdFCJBAR9SFMpUh
         7LSf311HTuCipJ7+3dIMN2Bg047fTMtj1ioZdoghIsn/z2b6teMHec8B2EnKdkMaBdd+
         OJDSRagyg0uyCaMisWT2BpJMP1663WWi7na3GA0gklG8CZxZCJ2LxwQf74MHvCmR+xS0
         AnMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757067365; x=1757672165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=upTwZKyiBNnC+OkjgBwo72rjaO0JALTLkZu8FhzInpo=;
        b=krVrVyFa0DM0WksfhkYbYXM9Aj1qidlhwMxoX0XiautrY3mhkDUZsbLMlRhCt6Tacx
         tDk1oKsSLA+15z+h1HkdBY9TEY8mCX858/Um6J9d7ZmFRLiz/ADra2zeZTzL/HgkK49U
         dF9kYC7Oyu3lUEaaNA5S22935Drhz7GLZ+x1A52CC1/sHYbPG52B9QzVC3D+tlUvkQLN
         qNwkq305cskWKOl5LF2ZhzsA2uncN8eptN9zfUZdYEfd83HWa9ZWdnc1I4GMmrvgrc53
         eMUpy4X9obVIwNa6J2rD1RW3EseUzLJhie9ddQNFTfHi0zV2dAIkHSnizJZkO9KJr/da
         1LoQ==
X-Gm-Message-State: AOJu0YxSoCOAUVc/ASdPhry2+nAy0O8HB2zi96r/jFMDrRVVLjh6Nmb0
	W9UGBG1QRBa95bgWT6LONFsjwkehkUJQkWF1SaytB9269L9MgLFJ9q8qyZ3XZXddl688t9Zspv9
	+2dhzXmWc5KO8S8plKs/CrfBfOrVpzEg=
X-Gm-Gg: ASbGncvHdhgIHtWZchweDHfibHk/FSmrZQlw8/9RrlEdK5lJMbwm5mNr0/VScykGh0T
	S6CHWwFbD1aGeqJObAN8LzT99aR1RWavlO0cb1C8HJq4WV2X5H/+qYMZOLOHVVmm7nEDT90AsbA
	qAg0EfmUHd04pl974557tiyjtbcWZXKJ7uP2L4PDuwGTYO3ykezcCS+rHsfp07YnyosPvMRkuDc
	3bSF6qguO98G6yu8Td9Bcfue4cK35MxNobPH/69kpHtoBqVIzkTz5miMQM0556eZ/V0VwaWnj2K
	m5RUMOyNc6ffzPMs5UGIdT4ZjfnUsVQQoRocbNWy
X-Google-Smtp-Source: AGHT+IEbz/0vHGTD60pyOKsJbzxXy70sM50ED6IHOdlwgbUoZ1y7MdxxdEUX0czRA4bAWoFjEGQdmeOVH3OYx0I9p7w=
X-Received: by 2002:a05:6214:20cf:b0:70d:f719:df3a with SMTP id
 6a1803df08f44-7209d44bc7emr151496586d6.61.1757067364980; Fri, 05 Sep 2025
 03:16:04 -0700 (PDT)
MIME-Version: 1.0
References: <VMV8.1757060410591652906.CpIm@lists.yoctoproject.org>
In-Reply-To: <VMV8.1757060410591652906.CpIm@lists.yoctoproject.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 5 Sep 2025 12:15:54 +0200
X-Gm-Features: Ac12FXyEixWOOHEem6_6Twrw-l-ePsWg3ztt8FhKlbmmjRgfRXne-tU-wn0JY_I
Message-ID: <CANNYZj9t1k+Ua-ftT2EGozxp1GZ5QHCHW0J1424pqo8zgxU52Q@mail.gmail.com>
Subject: Re: [docs] Performing Automated Runtime Testing - Exporting tests not
 described well
To: barne.carstensen@danfoss.com
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Sep 2025 10:16:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7486

On Fri, 5 Sept 2025 at 10:20, Barne Carstensen via
lists.yoctoproject.org
<barne.carstensen=3Ddanfoss.com@lists.yoctoproject.org> wrote:
> Maybe it is worth updating the commands in the document. And also if poss=
ible add more description to the oe-test script or at least link to some do=
cumentation of it. I am not able to find anything about it and had to figur=
e things out as good as I could via the -h (help) flag.

Yes, absolutely. Testexport is one of the more esoteric yocto
features, and is thus prone to not being well described. Can you
prepare a patch?

Alex

