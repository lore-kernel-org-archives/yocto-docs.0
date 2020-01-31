Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.2795.1580504668923506548
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Jan 2020 13:04:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XL1acayc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id m16so10238952wrx.11
        for <docs@lists.yoctoproject.org>; Fri, 31 Jan 2020 13:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=PPdU6CW0da0LhUSIbuBdzIcYYANH+fSs0ikM27jQGA4=;
        b=XL1acaycZh3eg3YaxUZqZ9zocS3+i0/YlQ10MacLKlOfeW5dUiNmaNuBngq4Q1uFP7
         qtZkVKujPhHTGPY7vUdKNcjrXmF7tBDYFP0au/TGKXtejP7eNWoFq2W0zJNFbsopJHrj
         MUMyrBVfMyroScd+2eNIKdPyYO5JFt267VV1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=PPdU6CW0da0LhUSIbuBdzIcYYANH+fSs0ikM27jQGA4=;
        b=QE0xcgnTFzZP0eeyHekxt4PmvFgxV5gTZIiMCl0sGbpMWnn+WFIte2jGzoee42DKM9
         CPoYb5Ow1BENgHmNzNqe0NpCNoTAdUt4iecQ8YBMiFnv1aYjd5PBlUaNG/Oak0iZIctD
         tCduScq3R2gesxVMviNjnLLkbBBxiy2X5TXOsb/DyBrOBZ5r6zgDSxpE587KNDXOzNPJ
         FsWvWTYOUHRWlYTLZvUjWY0JK0/ZtsB0c+qdLqRaYlU48/bZphfC1TOa4DSIKZbnxAyS
         5b8t9CH0Lq3IZUvGIXfF4D8ismc7uIWbryzoxy+WIxTf+WSJPRNWBkiZ6wk/zonhyjFJ
         1Wcg==
X-Gm-Message-State: APjAAAWyQhzVcVokVYB2RlexWnDAal9Fekbh+J7PZt30J5bnKHGISK3b
	oL+yjXglzkHc0LZt3AOOCLeURAj79Vg=
X-Google-Smtp-Source: APXvYqxo58qqSICUV/4eDoFeXWj7rXxUVF7y87L8b9t8QT8m6r0ZlOvOtm7WsfPbnM8eQPS40gWqyg==
X-Received: by 2002:adf:fd84:: with SMTP id d4mr261946wrr.211.1580504667270;
        Fri, 31 Jan 2020 13:04:27 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id q15sm13238916wrr.11.2020.01.31.13.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2020 13:04:26 -0800 (PST)
Message-ID: <8e70536cc06e573ce63f4ac7341545118e62c113.camel@linuxfoundation.org>
Subject: Sad news about Scott Rifenbark
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, 
	docs@lists.yoctoproject.org
Date: Fri, 31 Jan 2020 21:04:22 +0000
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I'm sorry to have to pass on the sad news that Scott Rifenbark, our
tech writer for the project passed away on Wednesday after a battle
with cancer.

I remember interviewing Scott over 10 years ago when forming a team at
Intel to work on what became the Yocto Project, he was with it from the
start. He warned me he wasn't an entirely traditional tech writer but I
warned we weren't aiming to be a traditional project either. It was a
great match. He stayed with the project ever since in one way or
another, he enjoyed working on the project and we enjoyed working with
him.

The concept of having a tech writer as part of the team was a decision
I'm proud of and it shows in the material supporting the project today
but that success belongs to Scott and his approach to it. Someone else
put that best, "He would first try the procedure or instructions before
documenting it, I was really impressed". He was hands on and wanted
things to be understandable and correct, a huge challenge with some of
the complexities we deal with.

Outside of the project he had interesting hobbies and travelled quite a
bit, those stories were good over beer and I have many fond memories.

Our documentation stands in his memory and its fitting some of his
character will always be in those words.

Scott will be hugely missed by us all.



