Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web11.25895.1615144785571995787
 for <docs@lists.yoctoproject.org>;
 Sun, 07 Mar 2021 11:19:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nWM7KSI/;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: john.kaldas.enpj@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id 130so7305057qkh.11
        for <docs@lists.yoctoproject.org>; Sun, 07 Mar 2021 11:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=3Xd9Yh2UvcVf6jN9k3fEyGQthizCdLOp+NGNKrHk/Ok=;
        b=nWM7KSI/CviPb4Gy6/ExkvhlwAcIGpXgo4TSuTcRBnKrerdgMDIUKF16otvgJb6Itu
         SBEG6dKRiI1+2yDkwodovdRk5c3czbLNaQedsypHjlNw2L4euQ+6wi4Ko/DbGXyKvVBu
         yg8LjWSYuKje8GaxqinVbxTFYLfwkzeT5knDSqShQVyjFqbDxNZj7qZiLstcUmGZTdEs
         IAycMimXa/ubYxPOUIetY1EHojrx0S8YQpGRNMn9JCuaV5SJ5wXzga+tKn62VMMl6JdM
         xs3rN9XMON5oWPLuO2502gzYCcBhPZ8s1lRS4URa7BV6iNLpDoN9LrJChcM6zjehXirs
         Pt1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=3Xd9Yh2UvcVf6jN9k3fEyGQthizCdLOp+NGNKrHk/Ok=;
        b=N4FOq+4ZMBXfXhYggNUOv9hQmg12UZPTkWPywjms59N3p7KWUiUjy85V797gexzlsu
         2pNiKZgeirqXfYuESl5gvEP9L0cYOJUsJBPcRsA/JoM7F177dCBMKojj95QKHbsN/X1+
         KbsZkTjJ+8KK7WrEb9nsVcSM8B7fLyuxCOnNz6zNx0IljecMI6xCmiwIaNtSfTZBUQDK
         35+2vcISrqwEqog0Sp42H9Src2JDijIIvpZe5DsIwZQDcER6FEysrWf+wyHXZzZ/t05n
         IjjY7/90KQv0NpV7/se9hyrji7C7PjUwIIoodz3KnAqsZfH3Cf9zK2YB4xsxd4O3TwWM
         G1UA==
X-Gm-Message-State: AOAM531fIUANCry+1Ji02rx8XS3BkmxjKU/c/DP8CSgbURlOnZolj3+z
	8km1uX6iwsaaocwruataJncgjwYJdh7vuAQV3Voi4g0anY4=
X-Google-Smtp-Source: ABdhPJxT929K+qXNB1lWd3E0EuGWCSBxFlHIojkKoRGcFqWVncy5EV5RCFCZZcb7g/5dNXyOnmWfIYwuESDNiK9zpY0=
X-Received: by 2002:a37:bd7:: with SMTP id 206mr10347807qkl.284.1615144784587;
 Sun, 07 Mar 2021 11:19:44 -0800 (PST)
MIME-Version: 1.0
From: john.kaldas.enpj@gmail.com
Date: Sun, 7 Mar 2021 20:19:34 +0100
Message-ID: <CAKPVPVrqWQSFJEsqD3r948MQLw-E2AcuY39yF50oif9=K_+c-A@mail.gmail.com>
Subject: Workflow for applying documentation changes
To: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000256e6605bcf733fc"

--000000000000256e6605bcf733fc
Content-Type: text/plain; charset="UTF-8"

Hi guys,

I am starting working on a ticket on bugzilla for updating some
documentation. Since it is my first one to work on in this project, I am
kinda confused about where to start, first is the workflow(should I branch
from master and just push the branch), second is what to use to test the
documentation changes.

Thanks,
John Kaldas

--000000000000256e6605bcf733fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi guys,</div><div><br></div><div>I am starting worki=
ng on a ticket on bugzilla for updating some documentation. Since it is my =
first one to work on in this project, I am kinda confused about where to st=
art, first is the workflow(should I branch from master and just push the br=
anch), second is what to use to test the documentation changes.<br></div><d=
iv><br></div><div>Thanks,</div><div>John Kaldas</div></div>

--000000000000256e6605bcf733fc--
