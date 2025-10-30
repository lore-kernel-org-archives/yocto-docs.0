Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D84CCF9E3
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 16:04:08 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.web11.1456.1761840247603713577
 for <docs@lists.yoctoproject.org>;
 Thu, 30 Oct 2025 09:04:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mbCoD9hI;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-63f8a31d126so678840d50.3
        for <docs@lists.yoctoproject.org>; Thu, 30 Oct 2025 09:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761840247; x=1762445047; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ycsfdQtxiPlMbK2E+7y0dS1Hi0f2J5r7USeYI0QgiQs=;
        b=mbCoD9hIBRBkxXvsErCqjaa5T+1YnLeYaoFMbolHayU+L3jT7kJT3zsEC+X5IN1cMt
         bDbpWbq/CKFwuXTnrcqqywGyRl6y4Cf0ucJ+heTBkLbNUCxYQKHGl3XFPZBKb3Li8+tw
         FlsmXuG7zF1MHOsuTGrqbWHHKcc6VSRCSRVm9BqapqWtSMyAqNrF+RVOKpGbjXdBpgDO
         KQRvxUD/fJX0npWW9a1XEyV3qO5DGZdQevZshpMxOzw5MrZ7MUk+mGVtPcm2npaMCoBB
         Axax1mCnWdc1mqOV7AjiSQkEYIKSQeIkTZXrLvQkwYOQKBUwVZsuJQu7ZByBF+ep37Ec
         SvNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761840247; x=1762445047;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ycsfdQtxiPlMbK2E+7y0dS1Hi0f2J5r7USeYI0QgiQs=;
        b=tcFgLU4gOIygxepl3qAwoV9gbtf5+RoSVI0jNFiD4OqV5gQqFZtbMATL4U9FRCLX5d
         X9aBBC3KpPbhKVr6Sax7lDJ8VR7VZNQHGaZ8jfMWjYgsHYUYrZhvo6QXlk4vXhX9M2lt
         Ch1WiPmOt1sG2UlptrRoBuLMm7Nrn6Amk5GA+mW9cHMUr7t3OduWmMEDky+kZ2/O1S4J
         uR05nmqFe8rL5RrB7+wSBbR6aPV67uX4q8xHk0vbsaHRke5iCNX1CScfbRx/JdKeCvIU
         poeNIu2MQOpEH8oM5rXE+lJb3SEbeqAi525lkbWTGT4fKaNxM+y8YZWqRMA5SOnncgUG
         YotQ==
X-Gm-Message-State: AOJu0YxHSYhFotCp0F7Kqn9DNmjAsVfTdVUetcYe2e5qiiRAC9JRt6Kl
	iMmPrro+93r1G9btzLKdTPDuYYngMSBqBJp/LQzPAhjTz4sy4jft+rZ2GJYppWHrIX23KMXnbG4
	3TdI7DAyOhnEOvbYlJLya3EqlKbums33CY01cT08=
X-Gm-Gg: ASbGncu8UwKMcvXE+bLtaOyKm0MheepGT+3RDJz+rDNkIQWdy6TRIrfuyeC8egtpuih
	JiyujlGvfM5RR47v5mEdhvvlyj6z5BMDMzH1Vngu49bLoUTnLOXjdjJYoHgxIIKmIf7mUfhY3iI
	1kGfB54FdMXrroLrvNmz6t7HqBIdlVOsVP+7UWZjkOBJdal/TjO1f5vdXfyJHvJCjTXi9LRIMJ6
	s3BePFFLCq28SHYiFid7PeijoVoYJ3R16tJ2VNyfEG1peoydBTlSdyGVnqb/SoKhae4BVncfCeW
	5NkST0XDiE0nagRoeePDdcOFpls3PrwbSaOaBd5bidSaUi2wb3BZsTXZqX4y/atWlywunXQXuSR
	4xSI=
X-Google-Smtp-Source: AGHT+IGJIpz4RqH3XKQRLxJeYUehBYDzDQjZQUUTUnChNSIPXGQlMnCqx2kS6uoei9fDne/h701/AIV+5c2pQ/sjhXw=
X-Received: by 2002:a53:b7d2:0:b0:63c:f5a6:f2f7 with SMTP id
 956f58d0204a3-63f76de9966mr4388884d50.57.1761840246289; Thu, 30 Oct 2025
 09:04:06 -0700 (PDT)
MIME-Version: 1.0
References: <e68572a2-7c31-403d-caeb-a5a4abc9d9cb@crashcourse.ca>
In-Reply-To: <e68572a2-7c31-403d-caeb-a5a4abc9d9cb@crashcourse.ca>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 30 Oct 2025 09:03:53 -0700
X-Gm-Features: AWmQ_bmPfWqeEjLUCznFPYPWQPKYJ9ag0ZHrAq0WsVzgezK_6mLv6uCWC-O4Ckg
Message-ID: <CAMKF1sotO=Z_uT5PdDrO=xtwFKabGiNzf2VcR+qL-4_7HJn=sA@mail.gmail.com>
Subject: Re: [docs] is there any point covering versioning of pre-release packages?
To: rpjday@crashcourse.ca
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000007fbdb064262663d"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 30 Oct 2025 16:04:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7925

--00000000000007fbdb064262663d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 7:54=E2=80=AFAM Robert P. J. Day via lists.yoctopro=
ject.org
<rpjday=3Dcrashcourse.ca@lists.yoctoproject.org> wrote:

>
>   here:
>
>
> https://docs.yoctoproject.org/dev-manual/new-recipe.html#properly-version=
ing-pre-release-recipes
>
> there's a discussion of using that "~rc1" approach to versioning
> pre-release packages, but the one example shown there:
>
>   irssi_0.8.16-rc1.bb
>
> doesn't even use that anymore, and in all the layers i have checked
> out, i can see a single example in the rpi layer:
>
>   linux-firmware-rpidistro_git.bb:PV =3D "20240709-2~bpo12+1+rpt3"
>
> that same irssi example is mentioned here as well:
>
>
> https://docs.yoctoproject.org/dev-manual/new-recipe.html#storing-and-nami=
ng-the-recipe
>
> but that technique seems incredibly infrequent. is it still worth
> covering? it just seems to break up the flow of that chapter to
> discuss something the average developer may never, ever see.


It should be good to cover since it is on the lines of semver format maybe
we should recommend that more but guidelines for prereleases is good to
have

It=E2=80=99s possible that other private layers are using it and having con=
sistency
is good for such

>
>
> rday
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7920):
> https://lists.yoctoproject.org/g/docs/message/7920
> Mute This Topic: https://lists.yoctoproject.org/mt/116031221/1997914
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000007fbdb064262663d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_quote gmail_quote_container" dir=3D"auto"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Oct 30, 2025 at 7:54=E2=80=AFAM Rober=
t P. J. Day via <a href=3D"http://lists.yoctoproject.org">lists.yoctoprojec=
t.org</a> &lt;rpjday=3D<a href=3D"mailto:crashcourse.ca@lists.yoctoproject.=
org">crashcourse.ca@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex"><br>
=C2=A0 here:<br>
<br>
<a href=3D"https://docs.yoctoproject.org/dev-manual/new-recipe.html#properl=
y-versioning-pre-release-recipes" rel=3D"noreferrer" target=3D"_blank">http=
s://docs.yoctoproject.org/dev-manual/new-recipe.html#properly-versioning-pr=
e-release-recipes</a><br>
<br>
there&#39;s a discussion of using that &quot;~rc1&quot; approach to version=
ing<br>
pre-release packages, but the one example shown there:<br>
<br>
=C2=A0 <a href=3D"http://irssi_0.8.16-rc1.bb" rel=3D"noreferrer" target=3D"=
_blank">irssi_0.8.16-rc1.bb</a><br>
<br>
doesn&#39;t even use that anymore, and in all the layers i have checked<br>
out, i can see a single example in the rpi layer:<br>
<br>
=C2=A0 linux-firmware-rpidistro_git.bb:PV =3D &quot;20240709-2~bpo12+1+rpt3=
&quot;<br>
<br>
that same irssi example is mentioned here as well:<br>
<br>
<a href=3D"https://docs.yoctoproject.org/dev-manual/new-recipe.html#storing=
-and-naming-the-recipe" rel=3D"noreferrer" target=3D"_blank">https://docs.y=
octoproject.org/dev-manual/new-recipe.html#storing-and-naming-the-recipe</a=
><br>
<br>
but that technique seems incredibly infrequent. is it still worth<br>
covering? it just seems to break up the flow of that chapter to<br>
discuss something the average developer may never, ever see.</blockquote><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">It should be good to cover sinc=
e it is on the lines of semver format maybe we should recommend that more b=
ut guidelines for prereleases is good to have=C2=A0</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">It=E2=80=99s possible that other private layers=
 are using it and having consistency is good for such=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex" dir=3D"auto"><br>
<br>
rday<br>
<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#7920): <a href=3D"https://lists.yoctoproject.org/g/docs=
/message/7920" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/g/docs/message/7920</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/116031221/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/116031221/1997914</a><br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" rel=3D=
"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/docs/unsub<=
/a> [<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail=
.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000007fbdb064262663d--

