Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web12.11315.1605120709774527513
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Nov 2020 10:51:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=DcTXWJb4;
 spf=pass (domain: linaro.org, ip: 209.85.219.177, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f177.google.com with SMTP id g6so1644524ybm.7
        for <docs@lists.yoctoproject.org>; Wed, 11 Nov 2020 10:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4MHu3hLiIqc98/q1btTgOGjh665FVNuBoKByuyrP07o=;
        b=DcTXWJb43PKbcChGjKMf1OW564LElFBh95/8icRGar7Vr5Q63Jn2/2rEkZm63MQ9Dd
         RZzj46T8H6FngUAzjQdrFsAAxT3UN/r2ZONjUBh+K4JrPBvkwf7KoMmTvZFyRztB/Di4
         C06CQL3bvP53j+n4yx2tuYFV5MhNb/d8sNBtgISPoKQM71F8B7raUSUQayABj2mVWS9F
         7Ye0nft4TCkzpaRoYxIAMteqdZYTja7/BXooa6RbRve78NA6k8E5Fuj3MtKWeb+t3+Gs
         vV7P2vmJ9R71LVhS5SMViFofE2vljY3prwg7FrYDgxjwAuIdA/qb3qsBnSNWIAQMF0zI
         //Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4MHu3hLiIqc98/q1btTgOGjh665FVNuBoKByuyrP07o=;
        b=BePSA/fulSR9UT177Rq3gf85nZOIdpdhbsxS12KHxsM2m7W/BSYGgYW5RY4/Is6Tbr
         Vy20FS1nhRQC8DSsK1zYXpTbfHazK1tZoCc9S3WjxqGDEsig7irBl6NL+AJt1h4XiibQ
         DnrCfF4K2aGLRSQFWNKuZRTI2cB8efC28nYM1ksanxpQ56gOVdxaNG9IPnHVzCVT6/xM
         JvxB39j38nm1l08ZR2K/mwD/ot2254PCpSVbqh9bCG2xqd4aktFXGeh21Hwz6B6tQn5x
         iM/zREQWDOP09hwQ4YxohN1LYtFohXAEqNT3HWwbD8fJH2hB4fIm5viK38gKHLqzN4Kr
         RPEg==
X-Gm-Message-State: AOAM530KwInPvTqXFFI2PKJ5B2FN6000c4VyZ0hVnZtht69JFG9RqeoI
	hqJjkNL4RiEA36N4tF9Po8AWYNVOOkSBZpSjIxFDjQ==
X-Google-Smtp-Source: ABdhPJwsqO+emWXYXeSXvu96t95uQBvYKAAG5ZEbGLhpRzk2p4sPSEAjyJdsnFEdiXJdpMfSVqS7sh3XPJxOc926Zfs=
X-Received: by 2002:a25:9b04:: with SMTP id y4mr3527452ybn.397.1605120708812;
 Wed, 11 Nov 2020 10:51:48 -0800 (PST)
MIME-Version: 1.0
References: <6MSa.1605119899931248809.4eHV@lists.yoctoproject.org>
In-Reply-To: <6MSa.1605119899931248809.4eHV@lists.yoctoproject.org>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 11 Nov 2020 19:51:37 +0100
Message-ID: <CAP71WjzH03194HxtTwPEe+ThxAQXCnZ=pwn_KF8meJ=r_gbF9Q@mail.gmail.com>
Subject: Re: [docs] First Contact + Dedicated Tasks for Documentation
To: shantanoo.desai@gmail.com
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi Shan!

On Wed, Nov 11, 2020 at 7:38 PM <shantanoo.desai@gmail.com> wrote:
>
> Hi everybody,
>
> I am making an Initial Contact with the docs community after the YP Summ=
it Europe 2020.

Awesome, thanks for your email!

>
> I have started to look into the docs code base and was wondering if ther=
e are any dedicated tasks/bugs that are open. I looked into the Bugzilla Li=
st for General Docs and will try to help out if there is something I can co=
ntribute to, but apart from that is there some other list I should be looki=
ng into for Docs?

I gave a few hints in my talk at the Summit:

*Automatic conversion was imperfect, many typos or glitches left over:
here i think there is a lot to do here. Basically, it's taking manuals
one by one, and finding visual glitches (and fixing them) or finding
issues in the .rst files.
* Offline documentation (PDF-like). sphinx can generate pdf, but we
haven't looked into that yet.
* Improve main page, nice looking front page example
(https://projectacrn.github.io/latest/index.html)
* Improve =E2=80=98search box=E2=80=99, perhaps with DocSearch (see
https://docsearch.algolia.com/ and http://docs.coala.io/en/latest/)
* Backport Sphinx docs for YP 3.1 LTS (dunfell): This task was
discussed on the list a couple of weeks ago. I think we have a plan
for it. we just need to do it, so perhaps not much to do here for you,
i suppose it's something Steve and I should look at.
* Better integration with Yocto Project website, now that
http://yoctoproject.org/docs redirects to docs.yp.org, the user
experience is not 'great', since we effectively leave the website. I
am not sure how to fix that, and I am not sure I will ever know.. so
if you have any skills in this area that might be useful (our website
is based on wordpress).


>
> Thanks and happy to be on board,
>
> Regards,
>
> Shan
>
>
>=20
>
