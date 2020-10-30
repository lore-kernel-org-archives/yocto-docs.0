Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web09.10507.1604045598860146735
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Oct 2020 01:13:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Hf4djAdz;
 spf=pass (domain: linaro.org, ip: 209.85.219.181, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f181.google.com with SMTP id f140so4427348ybg.3
        for <docs@lists.yoctoproject.org>; Fri, 30 Oct 2020 01:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5LBAQ08e5VSF6jAn3Vv1NKSQkoJmFgeLROstWeeolII=;
        b=Hf4djAdzqA2vk/Jx3KL3aW7isH/GrGPAjv7WryovuvXsrWbyXwrhg4DtzAn6eg/eRm
         kgZc3Tgi6+EwBAnOFfnBf11qZWbGL44h43r0lafZnDFVdkrUFzSgbWAqZPRi8xAKMhSS
         D+Au3Rf5lDcZCwFfllmN+XjKHu2IbxyXwGyoWyKa22SpZBBVprj4SFin514+lHe5u0qm
         zpFNKatljjNP2GWH75rshFWcZ4eu50JKZaZkaedSBb2EGoWD5Fu7j6R0Dm+QWdkqydGH
         kjRITkQwlzzp1wDWbvbbzQbWVrh6i8l38Zh48ToIrH6N2+ZTvrO/Yo/khJwW0Bqr+5GV
         dGrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5LBAQ08e5VSF6jAn3Vv1NKSQkoJmFgeLROstWeeolII=;
        b=HjSfs1/0YUGm2+8FGS8PsYbGShHlM10o3oohN90Ed6lgW/q6xzkz+S8UiSkZ97xN9p
         NJYZwq0T+lujJzebOuY9GgW0XY7CVfjmF3fnY6zqlRYuwlwtjXdyHd7t7g9Ply5Z7t3O
         8SLxtWC4L5vti8lakrJ0nxN6204m37jujkdWqCtm9wG2BeLRLVeV9WXN3k5JaElok7Vz
         /1SGBeyfSHq8mq0piNPwGxLQTfc3CKvqtOPl2WnwizH6Ap+8AgI33fsZzSXFrTX8+S2J
         fi9QefRPUi6ymrTSyDY/F7/H9LNAwluzBfKT2ddV0XOfTnOUfSsLORf47C62GWL0Wbff
         iJ8w==
X-Gm-Message-State: AOAM532mUt4H0jyhmIh3zDXZYCUkX67Kgwhp1j5j9N4K3+kOZ6qPsu8F
	qwwEfU4SzPrblQOeKci+zz95s6aSl6EX4zw0D/sTzA==
X-Google-Smtp-Source: ABdhPJyCLs6iLpcZd0z5Nho7K6XwQ2nKmIVAcCKhT2bFUY6WMxppWjKXYwf+Jn8nD+VxEDWKJqOodBJL1zCBVWoH2TE=
X-Received: by 2002:a25:6e8b:: with SMTP id j133mr2005786ybc.273.1604045597858;
 Fri, 30 Oct 2020 01:13:17 -0700 (PDT)
MIME-Version: 1.0
References: <afdb4476-bdb4-3df0-be7-457ebd473db0@crashcourse.ca>
 <c550db4b55fbc2b77d0a96d87ab5edf1@0leil.net> <9c9a716-3c2a-a663-8fb2-3b9d274cab@crashcourse.ca>
In-Reply-To: <9c9a716-3c2a-a663-8fb2-3b9d274cab@crashcourse.ca>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Fri, 30 Oct 2020 09:13:06 +0100
Message-ID: <CAP71Wjz4hOBfQj-9xvoO6V9TFX911_9aJ-rSdawK8WYLGb3p3A@mail.gmail.com>
Subject: Re: [docs] [PATCH] normalize use of trailing "::" across docs
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Quentin Schulz <foss@0leil.net>, YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 30, 2020 at 7:38 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
> On Thu, 29 Oct 2020, Quentin Schulz wrote:
>
> > Hi Robert,
> >
> > On 2020-10-29 23:00, Robert P. J. Day wrote:
> > > Rather than terminate a line with a single ":" and follow that up with
> > > a line of simply "::" to start a code block, we can simply terminate
> >
> > I think it's actually called a literal block? (was looking for documentation
> > on this :) ).
> > https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#literal-blocks
>
>   before i repair the patch i sent out, it's clearly worth asking if
> this normalization is worth it, or would it just be unnecesasry churn
> for no significant benefit? i'm fine either way.

I think it is good to add consistency, so yes. It might indeed be a
little tricky to find the right regexp (or set of). perhaps you can
include the snippet you used for the transformation in the commit
message, so that we can review that as well.

Quentin's suggestion to look at the differences in the generated HTML
is a good one!

>
> rday
>
> 
>
