Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web09.32501.1615185464647018398
 for <docs@lists.yoctoproject.org>;
 Sun, 07 Mar 2021 22:37:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=mDRq1LqB;
 spf=pass (domain: linaro.org, ip: 209.85.218.47, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ej1-f47.google.com with SMTP id c10so17897152ejx.9
        for <docs@lists.yoctoproject.org>; Sun, 07 Mar 2021 22:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IqRplP6r3wYy7WQcPnhB/0Zl1aVNXdzBPYjDgdSb+Xg=;
        b=mDRq1LqB6t3VLt8V+OjHKM6HhZYwwOuhY+smiVYFhH1Ypm+Ppu5ycQgk8T/CazSSP+
         ii4y4H6UxNdsOrDzMtlFr3foA2FlnJwNBaDQ9zIlLCedtIjluHvPf1g2pgxRzGh0/3gC
         IhxhXqbKx/Vanp+9Nioep/Cuij6YzHi7c5mpYXiGECNm2RJJpETucYnMtMgHy8nzRX7q
         K90VZG1E6onrQw70wYk7X4k2oKxTCNd2pKdHPAyLfAkFta5AMyRxrjVJTR61mwfAKz3O
         Z4YNHU6aXu+tolodMkXDorE4aX5GEnnH1P/DewfO1O2SQ4pdA86m+sviRnVRKGFWdRUY
         gCag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IqRplP6r3wYy7WQcPnhB/0Zl1aVNXdzBPYjDgdSb+Xg=;
        b=fFsEpi5tm/VCI/vOZpCtTatsnDCYulxZ5T8DifpwPHfBzfZWEDucbNJlvo85/PV1ZT
         wBkaT1ZQb9Y2yH/OVjdpatUtfT/GmoKptRRRJv0+jRU/TCQykohu8ceACxrGvHT6quIs
         eJUJRzEQj8yFaBLdkkbk5aW5PVOFmGG+OMOlV2Vc/id597SnZThUZk75Mc2eAitw+Mu/
         7o2HjslyUIwWV+7jcebtsfHqQskZ7CXl0imul30Q7Lu+kdks+96cSFEF9bnyqzP8GJ2D
         EWNvZy4ELUUXWDJClQFf7EHx+OucMHQz1QEEW2hcFY6wCqFGcNVBTy1Kac5Vx8qCVWdx
         Mzkw==
X-Gm-Message-State: AOAM530UHnbc5tBefC5tVhpxy5mBkt7X7h1tiwTtnpRv6FyJKHSIlpBY
	gGsNVa6k1wcH5rbaQeQG+TJghBnHL0E40GTkXT/rAQ==
X-Google-Smtp-Source: ABdhPJwu04+rmCA8sPQtCzVB8tvCrybZL4m1ihhTZ71CAsa7d5b+2QZ8UAVmzR///Ca6LK78AxJ/H2V0cQIwihJjV9s=
X-Received: by 2002:a17:906:8147:: with SMTP id z7mr12985026ejw.436.1615185462824;
 Sun, 07 Mar 2021 22:37:42 -0800 (PST)
MIME-Version: 1.0
References: <CAKPVPVrqWQSFJEsqD3r948MQLw-E2AcuY39yF50oif9=K_+c-A@mail.gmail.com>
In-Reply-To: <CAKPVPVrqWQSFJEsqD3r948MQLw-E2AcuY39yF50oif9=K_+c-A@mail.gmail.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Mon, 8 Mar 2021 07:37:44 +0100
Message-ID: <CAP71Wjx=aX_v0s=KpURiZsP-D7QMu7e6hWmKnOjJm66=vw+yAA@mail.gmail.com>
Subject: Re: [docs] Workflow for applying documentation changes
To: John Kaldas <john.kaldas.enpj@gmail.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hey John

On Sun, Mar 7, 2021 at 8:19 PM John Kaldas <john.kaldas.enpj@gmail.com> wr=
ote:
>
> Hi guys,
>
> I am starting working on a ticket on bugzilla for updating some document=
ation. Since it is my first one to work on in this project, I am kinda conf=
used about where to start, first is the workflow(should I branch from maste=
r and just push the branch), second is what to use to test the documentatio=
n changes.


The Yocto Project docs are hosted in this git tree:
http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/

And you have a top level README file that indicates where/how to send patc=
hes:
http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/tree/README

We typically review/merge patches by email, there are several relevant
sections in our documentation manuals:
https://docs.yoctoproject.org/overview-manual/development-environment.html=
?highlight=3Dgit%20send%20email#git-workflows-and-the-yocto-project
https://docs.yoctoproject.org/dev-manual/common-tasks.html#making-changes-=
to-the-yocto-project

To test your change before sending it by email, you can rebuild the
whole documentation locally, there are instructions in this file:
http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/tree/documentation/RE=
ADME
Search for "How to build the Yocto Project documentation"


>
>
> Thanks,
> John Kaldas
>
>=20
>
