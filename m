Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
 by mx.groups.io with SMTP id smtpd.web10.49484.1606209941838805446
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Nov 2020 01:25:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Ig5sFXMi;
 spf=pass (domain: konsulko.com, ip: 209.85.210.66, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f66.google.com with SMTP id h19so6089900otr.1
        for <docs@lists.yoctoproject.org>; Tue, 24 Nov 2020 01:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OTxorzG+X9RQfMtck0HjqBpbjg24ZSmSbbPxjKQBZdo=;
        b=Ig5sFXMik2jY+OexgDSnhOf0q4PYYzxV5Hn2bKh34Srm/68Q/eVxPgyzH/oQFS6+83
         FypLtoNHWBtnxMGIezdjJLEBSHSvGWsMOoT2NJTu7tSMPidlzBt+zr0yzpcehU4YhcTt
         LfQPffoLzy/pCHWiGcF570tQypao239jB0/6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OTxorzG+X9RQfMtck0HjqBpbjg24ZSmSbbPxjKQBZdo=;
        b=lbwjeTlP7BBZ5+LHYD53oYrIlYOEl58nMifJ4l+n7tEEGBnmEY5nEpW/Y2SI943sQf
         Vu/XBlHtIXFSONvsOtTidLHBBGJHfGFl3Ww3yX1wUgvqMK5ncxFmL3d2Ij04gbadA08K
         +b7NzwfgI2Ri+kOkWlF/fiTwrgKgkeYed3s8v6+xXvL9dXYxzizb3zkkoTV0FbNTmy3D
         trN8g/Za+JOVZmXCKbC2VLWnXSnPy7L8xX4csn8Npt1Z+8i14JObIibyEIB6TicAEyu6
         RHg8k1OyvrG/qP21xUXwwIvZVLiGXieiiKHYhL/3TB5JX8jPMNRuLvB8AnRx6pqSmJtc
         +6fw==
X-Gm-Message-State: AOAM533LjH79BHbbaaFsESPEboVoLFkaXQ0I+g1Pao5l4TPnHSgDpjvB
	KvnkNgE6O5U9DFWAfqJpIzCsBcEzOuuVlGYx787A2A==
X-Google-Smtp-Source: ABdhPJzXYzVZwDdfs373B0t5tL6JaGe7R8iBWAPhQqOi6f7qmsJHKdu91SV2WhkxR0BtTqSSOAleINu0RNx9xFUJOIs=
X-Received: by 2002:a05:6830:831:: with SMTP id t17mr2773585ots.92.1606209941188;
 Tue, 24 Nov 2020 01:25:41 -0800 (PST)
MIME-Version: 1.0
References: <20201123203245.2900-1-pbarker@konsulko.com> <CAP71WjzsEtkxaGprSCc7emQ=aqiNJAWcMzWRMRmQpSxfSc9SYw@mail.gmail.com>
In-Reply-To: <CAP71WjzsEtkxaGprSCc7emQ=aqiNJAWcMzWRMRmQpSxfSc9SYw@mail.gmail.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Tue, 24 Nov 2020 09:25:30 +0000
Message-ID: <CAM9ZRVvg+dijfUxJ1sCDrHnfSCUpTZ8k2hSKx1UZdw-Cd=2u-Q@mail.gmail.com>
Subject: Re: [docs] [PATCH] Drop old presentations from repository
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Nov 2020 at 07:20, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
>
> On Mon, Nov 23, 2020 at 9:32 PM Paul Barker <pbarker@konsulko.com> wrote:
> >
> > The `presentations` directory contained two talks which are now over 7
> > years old and are unlikely to be relevant to current users of the
> > project. They don't fit in well with the rest of the contents of this
> > repository and should be dropped. If anyone wants them, they'll still be
> > stored in the git history :)
> >
> > Signed-off-by: Paul Barker <pbarker@konsulko.com>
>
> Reviewed-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
>
> > ---
> >
> >     I created this patch with the --no-binary argument to git-format-patch to
> >     avoid sending megabytes of redundant data to the list. However that means
> >     the patch doesn't apply as-is. The following steps work for me:
> >
> >         git am 0001-Drop-old-presentations-from-repository.patch
> >         git rm -r presentations
> >         git am --continue
>
> You might want to post your patch in a branch for us to pull from.

Ah yes, that would have been the obvious solution. I was having a dumb day.

RP has already applied this to master-next so I think we're ok now.

-- 
Paul Barker
Konsulko Group
