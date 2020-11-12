Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com [209.85.219.196])
 by mx.groups.io with SMTP id smtpd.web08.2066.1605174850697533757
 for <docs@lists.yoctoproject.org>;
 Thu, 12 Nov 2020 01:54:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=GvrWEuOO;
 spf=pass (domain: linaro.org, ip: 209.85.219.196, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f196.google.com with SMTP id o71so4448630ybc.2
        for <docs@lists.yoctoproject.org>; Thu, 12 Nov 2020 01:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kY87YON8wKWADBhMIxEqGpM9y/BlXkZVglZ9VfGObBc=;
        b=GvrWEuOONmM+ywYDe/CJnN8CYT659NoXzVWUBoQ3gMAVrwuWosmmVk6EqUH9xoVkua
         EiWleqgbCsQtbzZ85+ifzns8zlVqUlYve00kPRhr8KOCJv0zeGUumhiFoAA6vxfZFk3S
         fNTPb5Ew32rqwlcShZTcNI0LJTTXPoY2AmjX78VazYSSxFZkhuYOtlwb0bovE5TwNyxF
         hZVAotZ1efc8D9QunOQ1bn6q4oaeyzEykIdOcg/TrMVQNocfdaknle6/7A31pSVMpk82
         cTdbkHtjdrT1qb4mF1vbz9zG7mKOgQU6juuFvosgc+JGNEIQUlEUgxA2KAvnU4Uqzpxi
         vZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kY87YON8wKWADBhMIxEqGpM9y/BlXkZVglZ9VfGObBc=;
        b=jQDsqDK7Hlvie1i7cYIrvPtYckOzzXBANc8l/TWMIQJJnCE9kVC0XbdJoLbcJ0kxtG
         rnB+bkejRREUBKRd50qIKin/RTOBaucukbeWcE9GmOcEp90Z/lGMlyD6g2KnOfNSsDIH
         zlqYeiJYS5N3Vj2ZHN7zI75CHmjXV3K7Uh8T9jterW1z5sjoObv0aCqsn7v/FoPqyAY2
         ANtobyXNZ9oFBaDY8Qv9fYE9yBXudsmixZnjTUvMEJHZSb8s+71xVd/TcYW53/pvcJUj
         tAliF+JUhGsM8EJMgOPrmAJaqiVJ6PP7+1+sosHCWaDYyDXZMgpu5sOL8Nkp8XH7V5PZ
         PAGw==
X-Gm-Message-State: AOAM5323ncuot84IoZe9zQv7WeJjMrf+R++bLU+GQizrvecdlQaulQ1K
	jLesrl2+LXZcRCWk+lpbaFVwRtBpYCI6Hq7T9X7VIJgyuljE1Q==
X-Google-Smtp-Source: ABdhPJy/x88ZdP3JKp7HquSaflsl++JoJQJtTVMpRwESld/ZxcCS9ovhc7bDjR9Y9vxgR7pYFdG4wdgeb4vVpgWRrN0=
X-Received: by 2002:a25:4654:: with SMTP id t81mr40321669yba.475.1605174849730;
 Thu, 12 Nov 2020 01:54:09 -0800 (PST)
MIME-Version: 1.0
References: <20201112075206.113124-1-nicolas.dechesne@linaro.org>
 <20201112075206.113124-3-nicolas.dechesne@linaro.org> <20201112093652.el5pz2dw2nkz3ick@qschulz>
In-Reply-To: <20201112093652.el5pz2dw2nkz3ick@qschulz>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Thu, 12 Nov 2020 10:53:58 +0100
Message-ID: <CAP71WjzrH3iX2VWXCjD5nas3bM_hL0yFc6RD+Q2obWPZXCrFpw@mail.gmail.com>
Subject: Re: [docs] [PATCH v2 2/2] poky.yaml: updates for 3.2
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 12, 2020 at 10:36 AM Quentin Schulz
<quentin.schulz@streamunlimited.com> wrote:
>
> Hi Nicolas,
>
> On Thu, Nov 12, 2020 at 08:52:06AM +0100, Nicolas Dechesne wrote:
> > Updates global variables for 3.2 / Gategarth release.
> >
> > Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> > ---
> > v2: fix DISTRO_NAME_NO_CAP_MINUS_ONE
> >
> >  documentation/poky.yaml | 16 ++++++++--------
> >  1 file changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/documentation/poky.yaml b/documentation/poky.yaml
> > index 85f42cf07..e184fa829 100644
> > --- a/documentation/poky.yaml
> > +++ b/documentation/poky.yaml
> > @@ -1,11 +1,11 @@
> > -DISTRO : "3.1"
> > -DISTRO_NAME_NO_CAP : "dunfell"
> > -DISTRO_NAME : "Dunfell"
> > -DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
> > -YOCTO_DOC_VERSION : "3.1"
> > -YOCTO_DOC_VERSION_MINUS_ONE : "3.0.2"
> > -DISTRO_REL_TAG : "yocto-3.1"
> > -POKYVERSION : "23.0.0"
> > +DISTRO : "3.2"
> > +DISTRO_NAME_NO_CAP : "gatesgarth"
> > +DISTRO_NAME : "Gatesgarth"
> > +DISTRO_NAME_NO_CAP_MINUS_ONE : "dunfell"
> > +YOCTO_DOC_VERSION : "3.2"
> > +YOCTO_DOC_VERSION_MINUS_ONE : "3.1.3"
> > +DISTRO_REL_TAG : "yocto-3.2"
>
> DISTRO_REL_TAG : "yocto-&DISTRO;"
> ?
>
> Provided DISTRO is bumped for dot releases too?

yes. perhaps. But to me this is another patch. e.g. a generic
enhancement, this patch is about 'fixing' the versions for the current
release.
I think we should look where we use each of these vars, for ex, I
don't think YOCTO_DOC_VERSION is needed as well. So perhaps another
series to fix them later instead.

>
> Thanks,
> Quentin
