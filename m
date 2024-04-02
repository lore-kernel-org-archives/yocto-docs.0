Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CAA0C6FD1F
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 15:23:51 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.130])
 by mx.groups.io with SMTP id smtpd.web11.15321.1712071424350596577
 for <docs@lists.yoctoproject.org>;
 Tue, 02 Apr 2024 08:23:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@theobroma-systems.com header.s=selector1 header.b=ErEHessC;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.7.130, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XAkzNJD+HzWT9cmPfmGrzDkgcTK3GpiuANj05Ijd8FUPSVvIqnmdvO6SRkiGSWDylkVVWRooeQqCXOubneI4oCdqxPye+AXoQ6loknTeyNCHIF0U+haLRC5vUBO+Zsfc7bY5JyEYnmbKMRVPp5rvIUTJYQYHxJXtHunX5P+S+t5f3ipLWYZAlws7dKp6lvlcDFfKdJZs3H10I4JbX5LqTcLesNAcgOXYVwIJDP9Cs6uZraOK1MC7qDEeVUp3eOU+rTjOswXf54FVk4HC7WWEFiEtlM+yag9LkYzrfSd43t1YvuR28QyWxeXNZ45ZNgNfL31LRNlXT09W11s7NEqtqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d/QZj81K+r8Ajg0QdLNY9ZlKPm5LvyDsjzNr9EUtYak=;
 b=YUwxO7Bhlx/QUc3QMi4u9BvJmiwszfUPABxprt70AjitMW1srOQBk4OYtyk6e/VnnM38b4m7lX+6gL8EEVrX2XGmNFCxloGyLJqoouuBga2cgJNpC2zh2v2nYf0BvktPGc7MF5EmdB8bp3Op42rynIiDWJKKXmKl1/HmseaiBK/NFCPAtp8KQoMDaO9BmbbZ27HpNCTsR3TaKyLTcL6a3hh48pETJ6xojynUevJX0wTcaXdQ/Cpfv7Xp3LieJdJEshCoJls20d+UPxvbZDGfg0jklK437KIspM7qwCee+ZoJ4QohbwBsm3XWUbcXASpTVHCuYz5gEOnyPHCM6xllOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/QZj81K+r8Ajg0QdLNY9ZlKPm5LvyDsjzNr9EUtYak=;
 b=ErEHessCFzpYxguVRvUBVjTllfAC4lIboyu5JQ2R+vxlL52E73Gi8kY5EAM3VrxGtNrzVBwsjmxJXB+cVLI/rhDDftwjEvHQwHoqrQF8J4oxZ9G/8rkZpfwlEoSAXU1yke/IehD510FmdcvuwqPw1Dt+epL+leLoJl0abNwOPmQ+2ZJALtjtnXiGKsICz9YD64NDwz01bvKID+jsjY8h3cIIlN2ARdZ4WDxzxK8aiHZiEEz/kRnSsiAyGAyZXX01HMpoxHz8P6zUfMUG/nfzSrdca5iAp+2bKWzOWJpKjdQYBPJ/vYlFo2miPe+lAh4ibtHzsWq//Bm7pTdw4op0Pg==
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by VI1PR04MB7198.eurprd04.prod.outlook.com (2603:10a6:800:126::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 2 Apr
 2024 15:23:38 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::3e70:7029:faf2:7779]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::3e70:7029:faf2:7779%3]) with mapi id 15.20.7409.042; Tue, 2 Apr 2024
 15:23:38 +0000
Message-ID: <0f9c617d-13cf-4d2e-90e8-43e661bdf21e@theobroma-systems.com>
Date: Tue, 2 Apr 2024 17:23:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 2/4] manuals: remove tab characters
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: docs@lists.yoctoproject.org
References: <20240330180829.1749526-1-michael.opdenacker@bootlin.com>
 <20240330180829.1749526-2-michael.opdenacker@bootlin.com>
 <0402377f-24e2-47e6-a28e-70be1e801fe9@theobroma-systems.com>
 <90f9bf1d-1cd1-4b42-8af8-41ab7dd5ed5d@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <90f9bf1d-1cd1-4b42-8af8-41ab7dd5ed5d@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: WA0P291CA0023.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::10) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|VI1PR04MB7198:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0covWFDQIVzgRqPvrgVCMS2c0Mhva8IcxZQ610VWwCmBbqcw07DVnNFmQ9FiL6aI7vouc4KpXadN7X9MQC3qZarjTCuaM+HXMOfQJMC9X07eEpNHKv5TI2+XzcspLEkuzGUAmCZ9bQPXh0BmbZJJ45fr4BvZmcDIMb0I+9x0akzTpRc7lhbQUouNtsQM+hxYQ1ICAtAaLVWpwmhjzA5iJVwGSoH7PB2/0NyjfsYXa8VvQBBS6RtyOqhnEc+hkqEDGk05HwiWIs4nU5EsrbklzZaPQj4L7dV3N0PRyhiIe6qhYMY/iXDwE8jMd/h3ta9LKpdd3gNTKD1spE5WrbecCrfy07FSYstxEkbWl/RomDlCm4VdBkH9Gszii0kI9QtPQBd/88gO8e1ce+a+H7U5YUNHRen5Ck+Pz5pZP5htZj7Ojtiw4habCJOgd16KKddLbeVZ4BXm13ZY7JtrlFxYMAZNM3wvFK+ACTPezFrvo3jNL4NJE01B4SCbdS7AWBuLYekn22xTzFkbKbK12XTYPG7WuX34HoSgX7ZvLUGtGzKfZ8XVbB7Vw0Pz9KDP8BzKFIC2sH0ALBt4p3Sld9j2wA6e0s/7wWoEQAYkwh1n17g=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yX7+ZWcoHrNg2A9/fIex05j3R5s79EIw7tn07Y7kq4HKgVuI8DbI6LWwumWr?=
 =?us-ascii?Q?3U6vbLvvmMDnZGb0c3Ncm07t+7FWNJXCfZ0U+VrwTn1Bw6tVUEy9ggjJlrJM?=
 =?us-ascii?Q?Nwwu2R2MrhB2NaWJQ7g1ngs64HN+NunxemW4PaclwyBCffBQkdU7P1x6Z+oq?=
 =?us-ascii?Q?UBvZasbxOPT+f9BeleJ6n2C4k+f+uJozKrio1fkzMF57+Gqr71cymJrpkGqN?=
 =?us-ascii?Q?leKs40rI1NkK2c1gigMFRrdS70V65GhNvihRp/WUgihw+4SQz3u04RyqkieL?=
 =?us-ascii?Q?6si5ONhqS/6rDUwDUjGqkhaHEWLt5o59A8n6UFRl9uB0elqbHwjHctCUMLP2?=
 =?us-ascii?Q?UFUPgK4LRT2ezo3Z1nOG7VOI11qBA8RwKP0h4W90Xdl0RRqf40lJ0C9v8kE/?=
 =?us-ascii?Q?RwBwy3cGbdXy6nlpJuUikqTOk4ZsqGtxBf7YYYBZj8vSDDfMeHNhVeTCPBeL?=
 =?us-ascii?Q?sHZxv1Kn1zdPtyJ9Rd0sGmb4L1ZvN4UjM9oAGuFAz40sjaK0kAasTxRpawmt?=
 =?us-ascii?Q?OTUxPftqHq3AEtDOUb4mG0VxccT26veqAtzbErgzebB9BUmOY6jxpMXcwxmt?=
 =?us-ascii?Q?f6qe0IwE1kKOpsld0RHrGSJ3A3CAQkdjK+DdmiaRi2spXhVbFdopoe05aAGj?=
 =?us-ascii?Q?27pQOgO6BhWdvhGVsHdw6GK7zEihLvAX6LlJWxpzEzOnxJ8ti3l4G0QK5lFO?=
 =?us-ascii?Q?KvgEX19q4h5HiQhIMVTXQsOt38CIlCLGwUe6mm1ftPfqnUVdn9LEQZ3fIAlG?=
 =?us-ascii?Q?14IfVdo4bOScbxZUsbIPQbt15tR/W2o2zJ5Lp4zQ11DvNx5bczQ7ApXlJd2f?=
 =?us-ascii?Q?5DqF1S7tPapy7H12w+M+4anmXOGLFbd3E/+kngFkTz4/S1mdxF8viVn1PwwM?=
 =?us-ascii?Q?MFaCWwx9nkIBioQJfOKXDS+ACePSVF9C5tS6t0ve/2BnywMAb/V2+MzkAkGG?=
 =?us-ascii?Q?AnLf7dstOPZPaSxnMmfPDXX5LdKHRGGkB+YIqfcLEMok33d4QW8wzPAGhr55?=
 =?us-ascii?Q?ip6bW8aGYAiwylOw2n2mOk4z5Rc+w9tBx4GVzHmHu0BiAgln+Clj5Q3JaDHY?=
 =?us-ascii?Q?6yQrKfQsN8EIHSRU8NLksp8yOP8zxKg8MXC6xCPmXM2hTiCQFwCivM2FWv/Q?=
 =?us-ascii?Q?4qt5SxupUlzwqxU+sHVRWkY4WFqXEmM5Iuy0V8rwsNIN9eAGKImom0+MepvJ?=
 =?us-ascii?Q?8IaHYW7F2XSWVHNrfssP5Cfe1hO6JcXO6Ls96CW6g6fvP8zEyyfcDFdtgMyP?=
 =?us-ascii?Q?Anm4VxTacJ/1ar5Rfodv1I2He+x7GCLScWIdx93JyvMg/ZXB/l/K/3cmBRaA?=
 =?us-ascii?Q?Crxre+VgTFmIouLjwvGDiBxRFpx9GccUSLkZFzYA44P6Zewu+uvJ2RqpfSJR?=
 =?us-ascii?Q?5ED3EQpyxAg40F6P7wbJ8L8YybMXhcneiLW6/D5/ZxSD6vp3RC5g8vcNdcOe?=
 =?us-ascii?Q?SJIr+o+fc9s2mjhVNzhkWrwyHBpnLiY2rydmuRyKH+E4KFSKpJfwqP3dMuMP?=
 =?us-ascii?Q?E0ODY2AM+yg4zLs5NLavVXvVGOdPoWTzwnfwF9IfmWoP7hA6KBOciBLiminp?=
 =?us-ascii?Q?bXHDMIFzfTrioWv/+S+2EnD6jVoELD98QZGJt9DLzR1/+/weBQC57OIj4cqr?=
 =?us-ascii?Q?Q4afMUwkFY7cqpE55a+VkZs=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a891038-0b0b-4ae3-0c3c-08dc5328df0b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 15:23:38.6906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aFK/i8M56P17iUc0utlzbFN544L5NC6nr3FBU4e4fvFAyl70HV2WEcwsYdu8/uY9IrrwuKIW4HQAlq5I3SANKg0PFul5sZhIkuQYjRE43hlLQFBDSrdAF7PdIqz99Npj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7198
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 02 Apr 2024 15:23:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5047

Hi Michael,

On 4/2/24 15:33, Michael Opdenacker wrote:
> Hi Quentin,
>=20
> Thanks for the review!
>=20
> On 4/2/24 at 11:58, Quentin Schulz wrote:
>>
>>> --- a/documentation/kernel-dev/common.rst
>>> +++ b/documentation/kernel-dev/common.rst
>>> @@ -1674,10 +1674,10 @@ looks much like the one provided with the=20
>>> ``hello-mod`` template::
>>> =C2=A0=C2=A0=C2=A0=C2=A0 SRC :=3D $(shell pwd)
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 all:
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(MAKE) -C $(KERNEL_SRC) M=3D$(SR=
C)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(MAKE) -C $(KERNEL_SRC) M=
=3D$(SRC)
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 modules_install:
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(MAKE) -C $(KERNEL_SRC) M=3D$(SR=
C) modules_install
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(MAKE) -C $(KERNEL_SRC) M=
=3D$(SRC) modules_install
>>> =C2=A0=C2=A0=C2=A0=C2=A0 ...
>>
>> I think this is actually incorrect.
>>
>> Makefile indentation is tab and not space, so this won't work. (This=20
>> is not the only piece of Makefile where this new indent shouldn't be=20
>> used though, so please be careful about others).
>=20
>=20
> Does this matter? If you look at=20

Well, yes, it does matter :D

> https://docs.yoctoproject.org/kernel-dev/common.html, which was built fro=
m the Sphinx sources which still have tabs, Sphinx replaced the tabs by spa=
ces anyway. So, in any case, this isn't usable as an example we can copy an=
d paste from the HTML documentation.
>=20

but that's a fair point. I wasn't aware of that. I guess that makes it a

Reviewed-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>

> What about replacing the spaces by "<tab>" here? At least, though not=20
> syntactically correct in raw form, people would understand that a tab is=
=20
> needed there.

Mmmmm, not sure this'll help with readability. But nothing better to=20
suggest.

FYI, we use sphinx-copybutton in our user manuals to allow easy=20
copy-pasting, maybe something we could do for the docs as well :)

Cheers,
Quentin

