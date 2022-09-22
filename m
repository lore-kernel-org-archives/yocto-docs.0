Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE456C6FA8B
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 08:18:14 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.72])
 by mx.groups.io with SMTP id smtpd.web08.4796.1663834683979547260
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Sep 2022 01:18:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@theobroma-systems.com
 header.s=selector1 header.b=LFp9msQy;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.0.72,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oSXYVAxsdV6LU3+Pm62kgsCmAAV6uaJdk78KX0O+FY4zNgua0tg4ekSeCzGTciCxOA96NBDYzVJpeKYSyfB7dUPEW0Am8ijBYMUcPTewI2RLwjH7rcUIcXIo24UfNHOje0KNkbLMmkGOLhV5qGXBhLwyQKClFD0zfvSORhGuoIS9jxsRE3QdjncD5Ut6y23za/ZK4KZRoC/8dimdQLWM3001Uuc+koQTh8+gYtf0yOl6yAGFeO7CZHs4+8IXEyRbJpYOBzt2uvnQZ0GeBXvZO/NabgwEp7o7RUzNkoUafiQpPDg6K/W7vcYLkHIuJ7ylTobBdnbCCu6RKL9/Vd/y8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xuU+/GAIdvrWUFok5bNJxM2Cs4cEOEKXcitliVjzxp8=;
 b=JXLxynEyoIv3bHrBT2BrUkH9f42gc0aLlcfEszSXrkJV6xRZqKycXFmIJNY50CDLaQW/drCPj4FWBTHKFne+TLiiPIUViGFdrFfNmsbp//4uSwk4n/PUXszpwKHPBy1S1n6dR5KMuaTecDz/4kt23hcg4w4ZdDPWCFJ3XkyF2IgU6px+WmHift+dF+EBuHyMM9xj/Sh12/uwIKC+attiWCxS2m4lz6jONiYqjTC0RYKMIA0qhbo2PCtfkpAGE5Lvkha7h+zhamQWufmH1O3lRvl5+YbR0j2XF0RPfNCeLadSoTgDXqTmJdFX5orkvDM5p0aDORoAU0mUdVmGw85ZoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xuU+/GAIdvrWUFok5bNJxM2Cs4cEOEKXcitliVjzxp8=;
 b=LFp9msQyiGu7PaUGO19g/i9ZsZ+EhVLJZ1g3+X/TtZ9AYoGuEpYUJeidsuL118kSCGtWhQhAfxVlIFwfIiLo37ozqmn1v06ctO90olhGKhL/E7af0nzFc1MbnhJoHJtYLehEDD9amWM4SQ3qT8UP2mXlCE3FJ3Ex5+HLuxLGgu6eIeWaqMtoV4BC8jsJCZqsl0jf8ASKUHbgj9XKF+u0F2UdCOTygUGJIA+xjab3ABUiUSD+sfbmIwcJ0SSWSm216AJQ+/VUNdD+qcwpHMsqka+BweaiV6sKUN7D/l5N6i4GjImoHUtICv2HaiezdC+dR6cw+G5VdM007YR1MQ5qww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by PAXPR04MB8368.eurprd04.prod.outlook.com (2603:10a6:102:1bf::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.19; Thu, 22 Sep
 2022 08:18:00 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5654.016; Thu, 22 Sep 2022
 08:18:00 +0000
Message-ID: <f70346dd-8574-0a26-af33-812cba9ba4d0@theobroma-systems.com>
Date: Thu, 22 Sep 2022 10:17:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [docs] [PATCH] ref-manual: variables.rst: refer to BBPATH in the
 BitBake User Manual
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <17171FA1D41FFAAE.30869@lists.yoctoproject.org>
 <0c84794a-68a2-bcf8-51fc-721934fac761@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <0c84794a-68a2-bcf8-51fc-721934fac761@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::16) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|PAXPR04MB8368:EE_
X-MS-Office365-Filtering-Correlation-Id: 1daec8a3-fbf9-4218-be0f-08da9c72f656
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5NNPoEg9SQ5u5mVI1ea9KTEGCE8QOuu7dZ1QV4K1jg5w38Gs+8GgQGgN79oGoeyoGTjheR80TpPt/O1nrAxfQ4Y7hvgZggFOCprh+GBYipGCS1q7CEGQcm8Io3jE2dN4SSJlxltq0Ug+lQriFHdXQOVe/FlrfuthQUrsx0kENPcJP0O/7K1gmcQIKA/wJsx2qsFvexrX1gmVz0va3Jdwvp51S2IDAJtL8NzgfM3HPGvKjAhmE3zzuloL3YG61vSMA8DY/rGm5YgBaJqHIpuAIfXtaPNZZKvcr3OkoQm3deY3VicHxzO2rYX4lv7VnjAfuqBaFwVg1voAjKeX52cCJkPN/ZdKmCBIIviKv9LQXlvqiAJgR1v4+oxjqQc2CU9s/j/hkVE1+bp+sGEzaUOh2aQkQwkOXcfE9sm94MAgMgc5/QWiQkfs9tOfd2RGOYD4GOkh8Ou2cBA2jRUYqA8tNH6F/1qND+GVG5uVg1X0CtNnyWorlhKrC5rE8T4U4vobY3GsY+eBLRod7i39FppmfaXiDGnoWCDyG0SD9fAXXRjZzKIV0Khqrmn7Y/CJspLJa/21k6kiUKeXpEy73VWAGxyBxQRh90MWz2pczM7n6SUQs3wyGQZZ85fpuYzijNVe/fousGbHHPyqSzMfxCxCTIX5GXx7jSQ7g1Mu+QX+/QX+63XGti3+lMqnml21Q6zmorFr5jwoJZR6ZRMOwXoX6QEhN5s3cxSYGlBmBajQbXT8WcOCeBaRPlbnw44pNUHOEBvbFEqYbq3oqjE+lBu6rBM/8AqQ1a4PdlS5ar7ycpo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(366004)(346002)(396003)(39850400004)(451199015)(26005)(6512007)(31686004)(66476007)(66556008)(66946007)(8676002)(36756003)(44832011)(86362001)(31696002)(41300700001)(316002)(2906002)(8936002)(5660300002)(478600001)(6486002)(6506007)(53546011)(38100700002)(2616005)(186003)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?b7RPrRPEkUb75x+XSSUL32XDPv0HmwDS/8r+88u6lLPYO8xoPA8Sbugcas9p?=
 =?us-ascii?Q?psjl/4Ok6vDBPQaq0sedS6zcLFEXxsQo7ZuQgvqYzPtfcGUIB5giaCZzxZSz?=
 =?us-ascii?Q?Ixqp3aIh0QpWbGHN02sFiqIXZ3aw5hkafha6Ah9zPC4wYCzTlKxcHiAUb+Xw?=
 =?us-ascii?Q?X5jvNopIVCaqn6rRWq3yVt9ygrvp4UHA+c0314QusOGNL/XYk01T1Jouh+Ub?=
 =?us-ascii?Q?rx9ErrIv8nxjDcJeyfWVF2jq2bjT6HJaOO4PIehIbIQv95pOTEywsYm0+lHp?=
 =?us-ascii?Q?6wMidoAENj8up/8drdLUQy1+p8mJuWhcplCdnDhi4ZxB80toR/RjjiKTO7mT?=
 =?us-ascii?Q?xH0FGn1SI+wGzTtH75WAASORswcaKpaq1c5zUGiOJOC3m3y5fdX4cE4HFBcg?=
 =?us-ascii?Q?OrnKN+/EbJRA/Inxe+KXMscqb+wZ8a7d2e4Kpjgz9iXCH4B8XmlwMcErJXLU?=
 =?us-ascii?Q?pycg330nH8M5v3NG98vhABy0rM82qVeDIx390K2TZ40sG4EAuRIPl1bMAdwK?=
 =?us-ascii?Q?mGIbBBbka7FmE9eZMEZevVCVdluDJBIJmeDuf/U4nZByHx80+SxGCmAtlROW?=
 =?us-ascii?Q?8eZHAPk9s8qqumFEj57pGhmNWJ+N0U/uG+E0e/4uO1JK9mtf/3RL/5yglHtD?=
 =?us-ascii?Q?durkLQYbYV+CG59lAZHvL+FfDUbxLGPOCj8sluc3T7WNjkhlOpdn8dVBhdRS?=
 =?us-ascii?Q?IXXwZJczFHzGVgQm/indDDjUnO135/HYLwoe5kCQXQjU/H0kfvdN5BUIfUSb?=
 =?us-ascii?Q?LYK2C/e+aBcGG3CmKWHKxKiqeaB6hDPTYL2eu81heGFF18N716rst2NmSEXs?=
 =?us-ascii?Q?fed03yNvrXptmcJnJ/p7BJdc+5QKDkFnTj9772oX+/ycMiMesrc458ssnqBa?=
 =?us-ascii?Q?SWc0CupxZvnUzfnra4uTnt+Hd/uR2F4SWpHDNjVw1aLGfnM3gTNZB+n8/+Do?=
 =?us-ascii?Q?RB22gabg2VQ+bb5qLluHrrMSJC3gzvaOAraHgTdChkye8d+rtZvEcNfVtGot?=
 =?us-ascii?Q?C9WlgnoTbT6YSEOyom3w1s2JhoIj6TLIfPW9p/t+R2P+JK/JuHXsTjEZMiZS?=
 =?us-ascii?Q?a5VW30xrp2drqW9ROchNKsqmiK1Y0HC5m5ITLZziA8We61tx+UuN92glCOMS?=
 =?us-ascii?Q?IiJlanqP+ZoEr+o9lDzJsGaTscjyKLZYnt1kD5Ve5juhGHHTK0WewNFR1jrk?=
 =?us-ascii?Q?hNUvlbtsf7q6oXA+TeG0iwAhtA6W18xdUFhYfz8vMUfrEy40tG2lOcS4bEFW?=
 =?us-ascii?Q?NTd18+nrQhyU4HOga+0fscsUT5M+Lggw3pHZFchN/Tc4YbYijExQsSGotzTm?=
 =?us-ascii?Q?5SJlziHj/CwA7kCu+1LAED6LWKI5/OMOOV6VPyJtLje01a9SbzxDWX2Ty2I3?=
 =?us-ascii?Q?yyrMMezMYaA+Svg4URqeU4uvNW/8pA59Z5xobjILsHeeAo8xunrKXM/0B1GC?=
 =?us-ascii?Q?gUhFFYI6e2MwC56pNR28933Y/Q/sTEpvYrtrIU7OQLyVyNDku2vj6wkPhIrV?=
 =?us-ascii?Q?/STxfJTjeWCkvfB+OXtr773xqxT5NS4D4tJZ1B2fSkuZzsbYQrKKBBhRMT9z?=
 =?us-ascii?Q?ATp12kFXBXDgo1dEbRBcm6LFeVG1c4A+CLTj8G9/ySO+20VS/kZrI33fOAuF?=
 =?us-ascii?Q?ZOv1ReViZ5/Xfe9GaOUMPU4=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1daec8a3-fbf9-4218-be0f-08da9c72f656
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 08:18:00.1475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 dWnP3w3hdIm1IUXFOLDkqaeKgsJSQf7TFMUdyZ3zR7qlIh9JnQ8BAjbosQ9PxDYsDzoUiGGZVBujFINpRd4EJoI6eGDjpZWK3W1agnbkb7hz8ZewqiLFZr+Af/4OZDgE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8368
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 22 Sep 2022 08:18:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3204

Hi Michael,

On 9/22/22 10:08, Michael Opdenacker via lists.yoctoproject.org wrote:
>=20
> On 22.09.22 09:56, Michael Opdenacker via lists.yoctoproject.org wrote:
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> As reported in [YOCTO #14502], the description of BBPATH in the
>> Yocto Project Manual is redundant with its description in the
>> BitBake User Manual.
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> Reported-by: Quentin Schulz <foss@0leil.net>
>>
>> ---
>>
>> Without this redirection, the references to BBPATH would still
>> work, as it this the case for terms only definited in the BitBake
>> User Manual, but BBPATH would no longer appear in the variable index.
>>
>> This would probably be a bad thing.
>> ---
>> =C2=A0 documentation/ref-manual/variables.rst | 15 +--------------
>> =C2=A0 1 file changed, 1 insertion(+), 14 deletions(-)
>>
>> diff --git a/documentation/ref-manual/variables.rst=20
>> b/documentation/ref-manual/variables.rst
>> index fe845bf375..f6cc66e2c4 100644
>> --- a/documentation/ref-manual/variables.rst
>> +++ b/documentation/ref-manual/variables.rst
>> @@ -729,20 +729,7 @@ system and gives an overview of their function=20
>> and contents.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 section in the Yocto Project =
Development Tasks Manual.
>> =C2=A0=C2=A0=C2=A0=C2=A0 :term:`BBPATH`
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Used by BitBake to locate ``.bbclass`` a=
nd configuration files.=20
>> This
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 variable is analogous to the ``PATH`` va=
riable.
>> -
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .. note::
>> -
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If you run BitBake fro=
m a directory outside of the
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :term:`Build Directory=
`, you must be sure to set :term:`BBPATH`
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to point to the Build =
Directory. Set the variable as you=20
>> would any
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 environment variable a=
nd then run BitBake::
>> -
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 $ BBPATH =3D "build_directory"
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 $ export BBPATH
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 $ bitbake target
>> -
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 See :term:`bitbake:BBPATH` in the BitBak=
e User Manual.
>=20
>=20
> As I mentioned in the description, the main issue here is that we don't=20
> know how to include the terms only defined in the BitBake manual in the=20
> variable index of the Yocto Project manual.
>=20
> That's why we have a redirection here.
>=20
> Another solution could be to highlight this constraint at the beginning=20
> of the variable index and point to the BitBake variable index, but I'm=20
> sure people will overlook this warning and will get confused anyway.
>=20

I would just remove the redirection, we don't have any at the moment.

What I just thought of right now is to add another custom extension=20
which would traverse the intersphinx mapping for bitbake terms and=20
insert them in the glossary the way you're doing it above, but just=20
automated.

I have no idea if that is feasible, but I feel like it'd be a better=20
solution than trying to maintain this kind of redirection.

Cheers,
Quentin

