Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web11.41034.1606159831290942969
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Nov 2020 11:30:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=TJVoeHVJ;
 spf=pass (domain: konsulko.com, ip: 209.85.210.54, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f54.google.com with SMTP id n12so13506104otk.0
        for <docs@lists.yoctoproject.org>; Mon, 23 Nov 2020 11:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=mJXTsgyoV98xQ/XO0xgvytX3ySDwbvwqBIiCHQeG41A=;
        b=TJVoeHVJ+NxmCeBz+j0RwvxABfSo4XPXMISNQLl9M7LWnhIDwRUNv0tAPfFI1aP/BC
         cvD6rF0QdacqcBdkYPgKjZToQJ6u4d7rqU9IgHPO25gQtD9X/BclbS+cWW139KveBhu6
         vNVZvTT2HFDX+o5h2NMIxxmVJvHKf718oqyt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=mJXTsgyoV98xQ/XO0xgvytX3ySDwbvwqBIiCHQeG41A=;
        b=LZFw0upxeQiOAUwKj5MMa5lnd+E0sjLal/pPIXB4HuGUFwVmAVJXorhgzklvG39bND
         tK5+8hiTnk/yOWJK8OG1901L2NJGF/yWe7n7OnZ3Ey1Ob+NdabioAriA4DsE2JLe62kq
         L9X8xr/t8Tax+bcli7mtxy9gV1XDLpr8WLo1CgziQgw5R6/OtAYLIhktXugktsuJGdzU
         65XX4uZ+RkzDlDwXRrUhVoLh491uCFcc3Wdzklb8NRg0IRIwzDJ0oYlvxI2UG/rhj+By
         FkN/YM6hpA1iAD/ulj6ZlzNurm0mEIuuHG5Xh3OZlZ7t0CK9SmC7jQSOdp/kJH0cTgiC
         0aAA==
X-Gm-Message-State: AOAM5325dNcm4qJ2nr2u8wv4h7I+ajOHJL14hoVEKBrNkTKuqkJsSgK9
	cFxKUF02c4mk1soUN9AG2Q2UyM135dVhpanOT3yhmAChqZ21mQ==
X-Google-Smtp-Source: ABdhPJzEiXw1jwI254uJkUaipzJDgNNgvjAIi1QXAtMOjbUbNSDhy1F3QrkyvKjlabPCtpcVPLb4o6wNqvX6szZnjPU=
X-Received: by 2002:a05:6830:1b66:: with SMTP id d6mr706242ote.258.1606159830354;
 Mon, 23 Nov 2020 11:30:30 -0800 (PST)
MIME-Version: 1.0
From: "Paul Barker" <pbarker@konsulko.com>
Date: Mon, 23 Nov 2020 19:30:19 +0000
Message-ID: <CAM9ZRVvsXTvLcT5+0c16Q=zub2wBZhUhdaudE5+qc_Pg8+vBdQ@mail.gmail.com>
Subject: Tags in the yocto-docs repository
To: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

Hey folks,

I've just noticed as I have the web interface open for the yocto-docs
repository (https://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/)
that no tags have been created in this repo for recent releases. Is
there any intentional reason for this or has it just fallen by the
wayside in favor of other concerns? Is it something we should address?

Thanks,

-- 
Paul Barker
Konsulko Group
