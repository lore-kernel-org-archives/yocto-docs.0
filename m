Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09E66D41C02
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 07:50:11 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4231.1765439401486577146
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Dec 2025 23:50:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ATk6X47Q;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42b3c5defb2so376685f8f.2
        for <docs@lists.yoctoproject.org>; Wed, 10 Dec 2025 23:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1765439400; x=1766044200; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TkDlExfivz4Y5UrvVTc4Y3rwCVGl+JOqd7Th+8CPiqs=;
        b=ATk6X47QUm/du/L08xOSR8NkvkpKyil3gE7K3auamSOPWNT7UN3pTs3DHy3eubkKzl
         g2mNSOE1oXMAXbPHZcj5UbzoYcziGFckkPqdftq8LgJSEowHqvVezZeEE1QBAHKNzwDF
         lKl3jZgryQk563LcKmoOD3RpHkoYcJlLGswVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765439400; x=1766044200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TkDlExfivz4Y5UrvVTc4Y3rwCVGl+JOqd7Th+8CPiqs=;
        b=L0T/5WbkFd9LOlHg64pYzUjis5iF6JH6gB/BEE8GAbjdzH+flHjMB4+sbgJqfCUAtN
         jaHmpeVXUBTQFeAKUkxd2++XCzYrRduvF1CX37PYPRXSYCIG2V0J5Cjng1bFW/kSo04h
         2EPNQLhtpNdXe1Ry/aBnkljsCot3aePnKRAj0I4Dv7b6dVBAEeEq646Q8hnpiYLuHEfk
         VQvtplyCDgby/1PRne6D/8m5dk95cLT9/YUC59Nay/6lrCgPVty9cb1rkYCyNxaUa3Qs
         nHJ6qrxN51R6Z7CQXL7rvgXYFZpxgXAeojyN4aY3rMgfoSJ0Pq0i9RVy3ibD/LReNPHX
         pMoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPgRoZ7FV5ZVSz1Lf46cWJenxoVS5ZkKi4RMS3X/pZYSex68JtmkheuGISEwNpJWGYhTAs@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzZrqNKfPeq6r1sOohLo3A1vX92h2i6r7Ex2VyNJZ6Nj6Dv0ScR
	Q89uOsRiSkxbs4Ss4kkC6lfYFGB3aa3nQIugDQuVgmOhg7iJQNBmvugA2a183BVvv2I6kmKrjiw
	44QUPwj77tW/a2XCzESH5SqLURkMHtNyfYGexhIm98Q==
X-Gm-Gg: AY/fxX7NEMCu0CQQBfQZ8wfiqUeYru2w1FbpCaIEuUFvW70tJy8wjE1m7Iqw5ayyBWJ
	GVSEZXBfPiRfFiWdFMY1vcrkeYI34r6CuZzRu3B/yC3tWl5ctw9lTHFu05vP7FRKzPRH/fvF1Fi
	06cbgoZ6SKGW3VlixYEBH1xHXbejhocpZ6fHl4MevH2ouR69D0TadZlY8CMNrHqWqr4/+bqSHsy
	XWfW9/NrwCaf6wSJb9LJRizhwCk9wyQCA6Fqqu1IJiwD4iTJ9PJGf1cimMUj+9zXrHCaDP3lqxT
	gdx9ozYY1Dcvm2+1AI/x47Q2mDW6
X-Google-Smtp-Source: AGHT+IHG6TfuP8rMI7MZa0bZngT4QQhWYFwXG0N1Yda9n/WizVkjBMvjXVNGsw5i0R3sBvhf5JLvvwf3f6op0EBqHcw=
X-Received: by 2002:a05:6000:1863:b0:42b:396e:2817 with SMTP id
 ffacd0b85a97d-42fa3af7eb7mr5821578f8f.40.1765439399841; Wed, 10 Dec 2025
 23:49:59 -0800 (PST)
MIME-Version: 1.0
References: <20251205234033.6363-1-swami310@gmail.com> <CA+-_CqnqT4roapfisF_6gt2P-OJ8gkw9GvRNEnWh9FQX6HU7Sw@mail.gmail.com>
In-Reply-To: <CA+-_CqnqT4roapfisF_6gt2P-OJ8gkw9GvRNEnWh9FQX6HU7Sw@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 11 Dec 2025 08:49:33 +0100
X-Gm-Features: AQt7F2rFTvoyWZnrrDDtPjMjDqdRQnm-drZLHkNIZOkQXD-59F7P8uUbVvwLBr0
Message-ID: <CAMSfU+5enXOdO03=d2Nfx6infFOoema2Y7xQG9VErNN1DgbE9A@mail.gmail.com>
Subject: Re: [bitbake-devel] [PATCH v7] bitbake-user-manual: Document BB_CMDLINE
To: swami310@gmail.com
Cc: bitbake-devel@lists.openembedded.org, docs@lists.yoctoproject.org, 
	michael.opdenacker@rootcommit.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 11 Dec 2025 07:50:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8238

Le jeu. 11 d=C3=A9c. 2025 =C3=A0 08:02, Swami via lists.openembedded.org
<swami310=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :
>
> Hi,
> I have not heard anything after I submitted Patch V7. Is it accepted ?  H=
ow can I know the latest status ?
> Please help me understand.

Hello,

Thanks for your patch :)

Your patch is in the master-next branch :
https://git.openembedded.org/bitbake/log/?h=3Dmaster-next

Which means it has been selected for review and tests. Once those
happen you will either receive a review by mail or see your patch get
merged on master.
Merges usually happen after the patch review calls (which are on
monday and thursday :
https://www.yoctoproject.org/community/get-involved/).
Ping back if nothing happens in a week or so.

> regards
> Swami
>
> On Sat, Dec 6, 2025 at 5:11=E2=80=AFAM Swami <swami310@gmail.com> wrote:
>>
>> Add documentation for the internal read-only variable :term:`BB_CMDLINE`=
.
>>
>> Fixes [YOCTO #15746]
>>
>> Signed-off-by: Swaminathan K <swami310@gmail.com>
>> ---
>>  doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.r=
st b/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
>> index 734c7858a..32860ec0c 100644
>> --- a/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
>> +++ b/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
>> @@ -116,6 +116,10 @@ overview of their function and contents.
>>        Specifies if SSL certificates should be checked when fetching. Th=
e default
>>        value is ``1`` and certificates are not checked if the value is s=
et to ``0``.
>>
>> +   :term:`BB_CMDLINE`
>> +      :term:`BB_CMDLINE` is an internal variable and is read-only. It c=
aptures
>> +      the exact command line used for the current invocation of BitBake=
.
>> +
>>     :term:`BB_HASH_CODEPARSER_VALS`
>>        Specifies values for variables to use when populating the codepar=
ser cache.
>>        This can be used selectively to set dummy values for variables to=
 avoid
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18561): https://lists.openembedded.org/g/bitbake-deve=
l/message/18561
> Mute This Topic: https://lists.openembedded.org/mt/116643097/4316185
> Group Owner: bitbake-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/bitbake-devel/unsub [yoann.=
congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Yoann Congal
Smile ECS

