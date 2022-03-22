Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73665C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 13:58:37 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.57])
 by mx.groups.io with SMTP id smtpd.web08.10190.1647957509067875412
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 06:58:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=qTVsEOqb;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.15.57,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aUYbPNpJIrkwrxiRYhcGOR5r28aOx0qMoE/SAAzpegyXan5ttW+FFTPYi176gQZsuI4XqTfmXsEpi/V+rFO92CKyUlA61xrUFUKjnpgdpTi4eyM7ClEXU0kBNCMZ26V6/aDYnu/6byuRulbac7LubYsizjJ2SswwqVg5JhCu9/82E/nqYzo9twmu1KWv9iPQkkW7my7rbXDGZJK0in0qG3tpesxMkZ/wpSTl+wo0Hb6p8rQtZbveJF7xkeD81K8DPQOyN07wWEry0Dzvd3/fNorDFpKI6lP26W9GFxjorkxtV0YYm/uqHrge3200Vz1stgLEyp1PPJ+tCMFDQ5SvXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R2UuCJk1JhYanoUkXJDUY8Znit3d2lW3dF0ByIsLqaQ=;
 b=SsE0IKNA5h4z6k0OdDumYStV2A5b/RuRdto/PGqEAHrz0Yw9+VvpIizHnCSYCDixZRZnjI5ZUMNzvxXynMUUk9D62k8E49kp5cwfVDyOFDufQ+iMO26wTt0Dlaw3gjXBSDrC5Gg6hLHOPESQhAB0AGONYeM4puCMMGfjdxEliHGNsNOUqlsNRfEWJcxtsNuLihRR3eYXgKGlk6OErwDuRN7H3UePJr+Q4GRxhFCe943bAdBm7d0bGhfDU5aVIZ+kX3TUQzv5YWPM1LlmwQlKKN/7iEtuwm4t/d4VN56xdcJacG9vaLzxOb51lJMmbBawT9COgjufSfXaPEaGwKUrCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R2UuCJk1JhYanoUkXJDUY8Znit3d2lW3dF0ByIsLqaQ=;
 b=qTVsEOqb0H8/8pVf8/9danOckgtJshuZsanr+ReLgE4UzDYXAF8BMGzDOFArv2OJnQM0XsUhvRgRQQdfTqqlT7xPbjrnfzty2v/wsidBc5YWdIDkwRhsndl7EL+/XWvX60TBKsLk10IuDHrdX2bS2TOqZQ3lKglSr6iEudlca4w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM0PR04MB5396.eurprd04.prod.outlook.com (2603:10a6:208:116::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.23; Tue, 22 Mar
 2022 13:58:24 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::1d2b:fd77:d076:a391]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::1d2b:fd77:d076:a391%7]) with mapi id 15.20.5081.022; Tue, 22 Mar 2022
 13:58:24 +0000
Message-ID: <bc6e6ce9-2287-cfd8-a3c7-6d9f54ecc1f9@theobroma-systems.com>
Date: Tue, 22 Mar 2022 14:58:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [docs] [PATCH 0/5 v2] Proposed docs version changes
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Nicolas Dechesne <nicolas.dechesne@linaro.org>
CC: docs@lists.yoctoproject.org
References: <20220321174455.1189669-1-richard.purdie@linuxfoundation.org>
 <CAP71WjxAtVJO2YvM3p4UM1TEYuqmM7TLpDo5kRytp+G=kQhSgA@mail.gmail.com>
 <ea41470f551f80509c947bf074eee5b29777953e.camel@linuxfoundation.org>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: 
 <ea41470f551f80509c947bf074eee5b29777953e.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR0202CA0056.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::33) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65e170a9-099a-405b-9b19-08da0c0c0856
X-MS-TrafficTypeDiagnostic: AM0PR04MB5396:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB53960AA9EB07797C0FEBCB6FC2179@AM0PR04MB5396.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZbMkq7fAU4gohdjvrq1iag0I8157lLy230YSABLtjNWtPDRPp2NOmzBS5wLS/bejQW6PU2yvluLdZPR0LgxSH/+hy4m5n9gwr+gYOj09e/RqRzyoM+guOP0ZvbF/9Vw2chISNaWOsMfKzQnnHhZDok1eaJJMFY8fP1MNwn7kAq+u7MAvdXSOwNeWOYL0cHP6cJTpdKsKwmqBtuyIYG8TTKk38D9Hn7dfDZ0SjOeJdCNggG8zMyRFIR4ocpTZ+FpUKejXTjKkr2ZnpuMkbQnu/KByiK+8VoYH3xjGIifizEa/tfIJLWh3XiUDOfHrsaFO+YeRUvblIbwt4pjWjiOlUl82jfIS27S7g6QuRqa+K5xWBhIomjiWEoHwbvZyh1mr/BBI2kiiLATaJ9let7QYeHV3HuMNztGiPhEju65Na6OvJvU0+p8wtmgaDXzt36A2HjZPiXJ61YaV75ZSN9pJrl+aMAT1n+pTbY2MFZYyUcyl1nZVY2PZsRBcjZDRNBfDsplOspno2B6oEoGeDt5kBxtW6Dd57k5ABEbmHEaoz+PzY/SI5eYxiFk8g+oJCAYFUipajq2wc0wWUNEcgdw2y5TbZhzMGehFqFidtn71JrqtGeu0NC18YtrrDtYGR+dP8wpP+fI2mdjjuzvjRyZyqbFM9bgQtdy3ATibrJDHiBIBUdr/mmNyD3OY+RlDVeos2Hf6E3VG5Sd8gOyhyF+0z9ddf0Z+70zeB6s1dSjfV/UH4qD83Oav7vmETYdC1fvJ3PirYYiyDNy0EZAUF/7pId33Z1itOVwOhmUNAFAPiaWe3imtA8WIQFg2C7C01ZWx
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(2616005)(316002)(66946007)(66556008)(4326008)(8676002)(66476007)(53546011)(83380400001)(86362001)(31696002)(6512007)(84970400001)(110136005)(6486002)(186003)(36756003)(31686004)(2906002)(508600001)(26005)(5660300002)(44832011)(8936002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dGshra6LKQQnt7rULhE3curqSPtAdpK5mwx4G+3LYjP7Xu3jVBKRo40hWc4q?=
 =?us-ascii?Q?ripz7LdDiA2y2SdBs3Sw8RRDecSRxiX/cD45tRD091zZek93FgTPurtfjH6X?=
 =?us-ascii?Q?ViCMSAGi2URJWKWYlNAXwlJsGYbYVqg/uX0d8YS5Nv0C4WKh9PmWE6dRPOhN?=
 =?us-ascii?Q?Bz43P/tdHG/9RquDZCOqBOrBfaMLSWYsOyqKZABc1kYG2KMaN+crWKgTQJr0?=
 =?us-ascii?Q?d9Yq+pkOi7sl84I8EAiJQqIPxY3G8XNUZUPhVyJ7n+l/u2GlBUf0WjLbQjX+?=
 =?us-ascii?Q?vb948Z5VZsAr4y0KQEq4d094CL6OtZl2XkhxPcqyQxamPmG0nS1h+uLYftXL?=
 =?us-ascii?Q?38n3CX2DP5ryxrq5woV6eabkaf4Qz17NxwACXXAgBJ7yX79egH14avcbVDGy?=
 =?us-ascii?Q?XlGsbAjXflna2wE04JFoslS5MfBSorULaiD6nmSK6+pWONvvM8216ifpQbAw?=
 =?us-ascii?Q?X60+o7i2V3EXlwQwjf6yKs5JPQOAL0AP/4R1Dj+hrWnMIeO9oea4aw5rii8a?=
 =?us-ascii?Q?4bsoPjXvy/mbhZIxWriZHC41rnlBvdsywTOrCo2asrL0botVzZL3xK3xZdxs?=
 =?us-ascii?Q?+ahLfkIxZQ1PaWS3WxW2YR9KwtB5AT4iRqXDGg2kRUszdt6/f7hEorGTolzT?=
 =?us-ascii?Q?hdqD1AbOeuE2+kKvPX0WyGTdsNM1J4Zu19lGY7SmTEKbBOuKuIVwl0ipu3Q4?=
 =?us-ascii?Q?w7Im/l2fkZLX2c4HRwms/R5cWUgj+SV54tOaDt133Ezkm1vvJLSYKCCLj7ZF?=
 =?us-ascii?Q?HM3G3hmJvol6mH0BKuxAjdEFl0m1T6gM8YDcG8hXqgdJet412XTzYHrWRoSa?=
 =?us-ascii?Q?9msOE7V1XNwS7JJeMEUON/8O0RIGNLZfpgECr1OEKTsqrKYPLRI58BcQWMu7?=
 =?us-ascii?Q?VInszO1yjIdnEC5k/9GZvO8+Bz3H8fI9U6wOHtc4D+zxuUnBc22z3CsqlWMJ?=
 =?us-ascii?Q?ps8J2zoP+8qLP5/LgZrR1rs7vHz7aUaJ8ZZ05jBW0wuq+Kk0brL9EoxcA2aj?=
 =?us-ascii?Q?SRaRW0xDkPKoC9ZbLSFz2z7VSloJDCEs8r6Oz17aVykmP6eW031a6ac5aM5x?=
 =?us-ascii?Q?z1ndLxMHrZsmgfHRB7tFk4FLiPCAvj/o9CYsGGwSx/jKslS/zX7pBiodNPOC?=
 =?us-ascii?Q?h6fuGqi/togFYHzVuAAyHCRo4SAV7a7mqUa6X1oVurACs1UcV3Pq5txOlFxz?=
 =?us-ascii?Q?seocpRItfZn6Lh0XGYBrxwX0dew4L/YA91xArtnIiZU+by478ZCHwEOvxMNF?=
 =?us-ascii?Q?5pdJuTMe+YYoys2sA3GLvaZ3k73ob25ieLoq+LlLLwOj7Now120zIqqM1J+R?=
 =?us-ascii?Q?cmE2Yo1kkukpEMgp11sp/tIj+rxnuJoId3my3Z998kMr/gYPukOfvrafToIi?=
 =?us-ascii?Q?4lgPoN/qhMcs7okezwpc6+UKWoBtMRHk0jDpPb/sgH+ZSyO5FwNfgv0/3Vql?=
 =?us-ascii?Q?bTNN58EyrAs8Hw3+n64EFGYBpK6NOILrmc25czDCpNVEqHZ8uhGE0+Ca0FqM?=
 =?us-ascii?Q?sRHOP2X321GTbdo=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 65e170a9-099a-405b-9b19-08da0c0c0856
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 13:58:24.6630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 9GJ6fv2lkacyOiESMEKEe6mJg5B1LVvNcgTQgRk8st3jHbWo75Drep6KZ1Ruqk24ud586aNFK6I5LrNa01yNeLaP+40GKsBZ+uQ5BiSF9LWqvqA1TCH/wQKcmdBV4mDM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5396
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Mar 2022 13:58:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2678

Hi all,

On 3/21/22 23:06, Richard Purdie wrote:
> On Mon, 2022-03-21 at 22:56 +0100, Nicolas Dechesne wrote:
>>
>>
>> On Mon, Mar 21, 2022 at 6:45 PM Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>> I've tweaked my patchset with some review feedback from Quentin. The v2=
:
>>>
>>> * uses yaml to load the variables in conf.py
>>> * fixes a bitbake_mapping[i] -> branch
>>> * fixes a comment typo in set_versions.py
>>> * comments the bitbake langdale version mapping
>>>
>>> Richard Purdie (5):
>>>  =C2=A0 Makefile/set_versions: Allow poky.yaml to be autogenerated
>>>  =C2=A0 conf.py/set_versions/poky.yaml: Set version in conf.py from pok=
y.yaml
>>>  =C2=A0 set_versions: Add support for setting POKYVERSION found in olde=
r
>>>  =C2=A0 =C2=A0 releases
>>>  =C2=A0 set_versions/switchers.js: Allow switchers.js version informati=
on to
>>>  =C2=A0 =C2=A0 be autogenerated
>>>  =C2=A0 set_versions: Various improvements
>>>
>>>  =C2=A0documentation/.gitignore=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +
>>>  =C2=A0documentation/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +
>>>  =C2=A0documentation/conf.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 22 +-
>>>  =C2=A0documentation/{poky.yaml =3D> poky.yaml.in}=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +
>>>  =C2=A0documentation/set_versions.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 225 ++++++++++++++++++
>>>
>>
>>
>> Would it make sense to implement what you have in set_versions.py direct=
ly in
>> Sphinx 'native' code ? e.g. directly in conf.py, or in a module loaded f=
rom
>> conf.py (see how kernel does it at [1]) or yocto-vars extension, or as i=
ts own
>> Sphinx extension?
>>
>> poky.yaml only purpose is to be loaded by yocto-vars.py which is a local
>> Sphinx extension we created.
>  > Possibly, yes. I've done it like this as it was easier to validate it=
=20
was doing
> the right things and also easier to apply in retrospect to previous docs
> releases. What we want to do going forward is an open question and it doe=
s feel
> like that script would be better off as a module that at least for master=
, the
> docs code called into.
>=20
> I think that would make most sense as a follow on to this series if/as/wh=
en
> people have the time to work on it and test it accordingly. As it stands =
the
> series was already quite painful to develop (I got hooked on Friday and h=
ad to
> fix it on Saturday whilst I still had the pieces all in cache).
>=20

Agreed. I don't think this patch series makes the doc building situation=20
worse than it currently is so there's no reason to hold it off. Makes it=20
even easier on stable release maintainers so it's good :)

I just would like the behavior to be unchanged wrt versions listed in=20
the switchers.js, the rest is fine and can be modified later on.

Which versions are listed in switchers.js can be modified in a separate=20
commit to start the discussion (or at least have a "note" somewhere to=20
explain what are the expectations).

Cheers,
Quentin

