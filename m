Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web10.15895.1604072344651969995
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Oct 2020 08:39:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Kp3NHQLR;
 spf=pass (domain: linaro.org, ip: 209.85.219.180, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f180.google.com with SMTP id o70so5480092ybc.1
        for <docs@lists.yoctoproject.org>; Fri, 30 Oct 2020 08:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MKQ1a+RxywQlPsd5L1WjfzFnyXjKSjCt9xpL0jAD6Po=;
        b=Kp3NHQLRR45Ta7sUHH7lohoQN3W9me/LrkpSj4NSKD3Wtk1g5J6/XgqUo8zO0Iaiuh
         cCMavM5GtCvKO3JMCPf0jYMa9LHich70klRuC8/jLGmB387IN8agkcjHvj8SE/wNKcZ5
         jgkVcGs6VeBiz5U2i8PAY086GYFEAYCmJSZbp5QDh/m4ejL9xX5sftQ6LB9y+ar2+so6
         Bw4DQgk2Higd2Rl67ucaCMBKVOx4gOnUZTqHfHZjHeA5T76YszwHbnzD10BsOznL2i3G
         fNXlU2F376+ewEuSrRv0Zdd0p5Zag5ssMmSf3+GRFUVrxv1MeMccGsQ0t43r+p1QH8bm
         LKcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MKQ1a+RxywQlPsd5L1WjfzFnyXjKSjCt9xpL0jAD6Po=;
        b=dOob7MVxozZpaWyFcRK1Dz0R5MbABehMlxAR4+j8wwyR1CIvdjwQyXLfAQ57nSaiK5
         GmzPKEH9DQ67znGxor8tDtwCoCVzruDuBF7fce3EiMj5qTpO1NMUPRHXwcgudMjZYEn7
         SgLXxfWihBGFb9ECARI+RDda9NAshFtXeEHiNe0IP225ShON9b8E6cfS+0+TVZIil/vA
         J2ZgDAT0wSLegnuvNpsOfNrmnpB8U2HCTxUtU93KRBEtHhMgEjBm5gt9KBd+96ZaGGtI
         J8Mkk0rsEPCzuzqJbKmP6kUMErFYXqj04SFyP7M/4676eapi4ddSuq9J/cGMCJAfILZO
         rzBg==
X-Gm-Message-State: AOAM531Rr88Vem+Vm78aCn/FVvWMXWclxIaajF+uBgnWUi98+2ncGqW0
	BM3CTc6Bsu06yVD+FIpqQ52Ndm/agjJiSkOgQ5x83A==
X-Google-Smtp-Source: ABdhPJwflifx2jFFSYg9o1I5sMeaCu/WCOitYFrvWHCFDLBD+V81Iw0tDp0l0Cv21BnIM2HLuSck3kDBrNe2D0BonCE=
X-Received: by 2002:a25:3813:: with SMTP id f19mr4380446yba.373.1604072343728;
 Fri, 30 Oct 2020 08:39:03 -0700 (PDT)
MIME-Version: 1.0
References: <532f9817-d5ba-b38a-aa64-7a7f6d2765ef@crashcourse.ca>
 <CAP71WjzfwKuxox9PbfO2ArhJhyhSo5q2KDkPgt4-y5YnkyEvzQ@mail.gmail.com> <658164b7-d4bd-e584-d855-c2ef9ec16ed7@crashcourse.ca>
In-Reply-To: <658164b7-d4bd-e584-d855-c2ef9ec16ed7@crashcourse.ca>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Fri, 30 Oct 2020 16:38:52 +0100
Message-ID: <CAP71WjzYDpiUH2vCAtYW5gqZf5pDQq7Noiy-CBR1nFihNVW+5Q@mail.gmail.com>
Subject: Re: [docs] [PATCH] adt-manual: delete obsolete ADT manual, and related content
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

Richard,

On Fri, Oct 30, 2020 at 1:35 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
> On Fri, 30 Oct 2020, Nicolas Dechesne wrote:
>
> > On Fri, Oct 30, 2020 at 10:35 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> > >
> > > Since the ADT manual has long been superseded by the SDK manual,
> > > remove the entire adt-manual directory, and the references to it in
> > > the two top-level files "conf.py" and "poky.yaml".
> > >
> > > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
> > thanks for the patch. It looks good, however I am unable to apply it
> > locally (and Richard as well can't). Can you please check and
> > resend?
>
>   that's weird, i built it on top of the master branch. i'll try
> again.

After chatting offline with Richard, I ended up pushing his patch to
master-next, looks like removing the binary files was making things
harder. The patch is good AFAIK, feel free to signoff and push.

>
> rday
