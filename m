Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.502.1593027413265928799
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Jun 2020 12:36:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=S2G8VwHG;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: twoerner@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id w16so3627179ejj.5
        for <docs@lists.yoctoproject.org>; Wed, 24 Jun 2020 12:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fxrgEMdNoAnbCP9G/ViGk+UkrZZPhqilpjqqq5rPVQU=;
        b=S2G8VwHGiPeVlLOaZcVT8JUIfYEx35MvwQVtdfm48RFrAIh24ur5GrZtRY/cTR0yd1
         MgClWpVqqN6AHemL+m39A4o568cFlp5VhMI6KY1JepuONX5w1zGxcR/uPeKDB+hy9yvH
         nCTqXwZFerxlTDrtOmqeH5olNLDFxuvEFn5xXGt8J9Bd61fl9R84+pzxUBECxo6DlGto
         OoViGj3rINSvW6z5V1vU1r6aXqGlFdThfDQJHnZgl+GZRS+V3dqtVS4o4vvbOct7E01u
         s0KnAMs48JF68sGKifca3Sel5mE69nE/lcnG4o2vhWVvD/h8bd3patZp43akI/mAmqrd
         dxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fxrgEMdNoAnbCP9G/ViGk+UkrZZPhqilpjqqq5rPVQU=;
        b=UwINsH93gTwffD8p6rM0r44iaWikEutZwd8UDpG6GPO+14lbGvjk8KfQ2gpEZR0LRz
         rhPp3dWyNHUG4Idv+1QOS7C7plufVkyQwqgaEKMDh58ypK123GdJ8bGYsVeWOw8SX5IY
         Ukjr0TOIcbm0qBv07l7gCC/QQ1QZCi8httXniorbD0ihHdcPfKWHwsnRIzbWQsGTkwp7
         pi38Odsdglb4ajuD2J0gphw5/0fA0AjJCDRaGNfiVPFzIK/wUlgTbUvD5lzWMY68MGMM
         vsZ0XfZIXdPHynSM6BLH2Nr8VaBuWI1qOWcgYcA+L7XZfC105doymv3mVw3JW0qF7yXl
         /7+Q==
X-Gm-Message-State: AOAM533NfwP2QglyYk1LFes+IIG86sO4D20QyT82+s5+u2KieoFfbic9
	TFcQ8B86Z3vTdHjR0fOsejh0XRLhyWRsqvO+hsAu/w==
X-Google-Smtp-Source: ABdhPJwq93+ShT8wL4Mo41iBhQLANp87GpZ512Wok0Lids3aq1vPanW3tiA0cbRHyr/Y3wnbHJw2X3CGOmKc9nVGND0=
X-Received: by 2002:a17:906:4155:: with SMTP id l21mr20321332ejk.438.1593027411836;
 Wed, 24 Jun 2020 12:36:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200616211450.8079-1-mark.morton@windriver.com>
 <4279ef01cf93105bdea2e3d56e8df50db18350d2.camel@linuxfoundation.org>
 <DM6PR11MB367626B3068F92C3DD31D883E59D0@DM6PR11MB3676.namprd11.prod.outlook.com>
 <CAHUNapR1azgOund7LtARa-N8mAzm-5H7fnv2==gfNS2yGagq8w@mail.gmail.com>
In-Reply-To: <CAHUNapR1azgOund7LtARa-N8mAzm-5H7fnv2==gfNS2yGagq8w@mail.gmail.com>
From: "Trevor Woerner" <twoerner@gmail.com>
Date: Wed, 24 Jun 2020 15:36:38 -0400
Message-ID: <CAHUNapTPp1pnArEserQKzej4chvOnmf21rwcXu_tn-PrfpmC4Q@mail.gmail.com>
Subject: Re: [docs] [PATCH] New source files and Makefile update for Test Manual
To: Mark Morton <Mark.Morton@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000000005c005a8d9994d"

--0000000000000005c005a8d9994d
Content-Type: text/plain; charset="UTF-8"

PS the other docs build fine for me as PDFs

--0000000000000005c005a8d9994d
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">PS the other docs build fine for me as PDFs</div>

--0000000000000005c005a8d9994d--
