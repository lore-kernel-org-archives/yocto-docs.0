Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BEFEC433EF
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 08:30:23 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.74])
 by mx.groups.io with SMTP id smtpd.web09.25439.1653294621141305335
 for <docs@lists.yoctoproject.org>;
 Mon, 23 May 2022 01:30:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=Q/ZYRmZ9;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.5.74,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iBWMqzYFR6x31DAA+9cFuXcYSLVHn8022SXZvWJ9dB7gf2nAnw+l/6Mb8w/7Jd/KN0twTCZrptS7O1bhVyOWLP+a4mfJWi0LuPo6+sEcOKfEg1WvUScHZXRSbxzDgv/92RDSyU8P7KJODzi7IMo1wyIO9oZHkE5mGtyoR8Ejev+9ZZd22XXRWzbI949sHoTJW+1eDFqNrMx8iDSscB4q1LxLx0aHuYpn2nhZKW+3IKbk0bmoqDWabd4VMjPkHbd5fZdnhoASK9+IKuPXrZAPZKbzl/tsGCxFIp2feJjh3y3sw9Oycsml69EIjTCs3gQPCkklt7YrkG0tYTeDzNiYPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5inQNCwtb0+tCOdone50IB0r6+R0+HNW7ZW8h+lqizo=;
 b=V8d1OO7ZyNSntr4V1BtaPNoxUFH2VB+zuTexZ0TPFvjY4RmYviuCBOgzELXHZibBdDZxKexyuWYtqP93i7rREscUyiiWdKjde1CNc/4ijnFq2NRXiu+BY0W2vdfeuy62k8BpGmCaRnOLGtSpZmvvdHUoyGX6fV0QZg1U4QCPEDhhGDgx97bRHE9V2DKOI/2omLTWNbAtzUep1gL7oGUu8zrFvE/o0cFqTCPUgjMfhPCDeRMWdDBetcAZbaf0ILJZ/U0SMkM87lTo+as9FUxOOYLs1vqwrFv+cXuJzZxh3Xa9xBk9+WjxPmC5wv5jMnVBVi+RM2jdS/cmN5r1g2y2Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5inQNCwtb0+tCOdone50IB0r6+R0+HNW7ZW8h+lqizo=;
 b=Q/ZYRmZ90/YrIojXZQa9N0mmdUs19cy2IyLM2/7vbpBAl+OKHmkHriGXmR8upKZFq/SKI1Nf5XXhwnfRTQAxsAPSsif6tAXraEpnvFcf243ageGUhnZhHTwf6YaLLpbmAApHulo/JP8Y/pN0N0Ye2xQjXBD0qZBlfHar5M2rZfY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM6PR04MB6229.eurprd04.prod.outlook.com (2603:10a6:20b:73::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.22; Mon, 23 May
 2022 08:30:16 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::e443:c646:c299:5512]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::e443:c646:c299:5512%8]) with mapi id 15.20.5227.023; Mon, 23 May 2022
 08:30:16 +0000
Message-ID: <5af9dffd-6315-f7dd-323d-a05c3208c77b@theobroma-systems.com>
Date: Mon, 23 May 2022 10:30:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [docs] [PATCH] manuals: add documentation for WKS_FILES
Content-Language: en-US
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
 docs@lists.yoctoproject.org
References: <20220520183517.141145-1-michael.opdenacker@bootlin.com>
 <10955e67-9690-c82b-0b5b-c599aa3dd140@theobroma-systems.com>
 <b6f866e9-3fbb-11cc-339a-6c7455a01ad7@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <b6f866e9-3fbb-11cc-339a-6c7455a01ad7@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR04CA0142.eurprd04.prod.outlook.com
 (2603:10a6:20b:48a::16) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 054601f9-86fb-4123-47a0-08da3c9676fa
X-MS-TrafficTypeDiagnostic: AM6PR04MB6229:EE_
X-Microsoft-Antispam-PRVS: 
	<AM6PR04MB62294DC52B6A6CFB52D863D5C2D49@AM6PR04MB6229.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3txLzturJZQuMQBJCfUpHvp5ZqqReDGBpf5Hb+1NYSfk4CHXhUjaYASoO/qmhph2Tcak1ynn7i3pMaD4a9tL1DEWw3pBZSTYPEKPpJiIuLzJtFDtrPWeyksfnVyLI7J/e+Ebjf6iFvkr2V5x9NWk+bY/PZ+UOKyy8Jh5REkABxHKdsxYG7pEFAGb3Png3/oO2HCMRtWXJjhP2N2tSc/zrvIJ/OKCyLsZrEPAGQlnbyEekFqGQ1IMpKxWujKQDXP8t/YzvetIIWylQ63rcl40t1SSwVqwXrVMMTKg+VaZSDesiPc399QyxwvDqcn2NhnNN8UzzA+p7wMaPjAViiO6+USNJilvLJxA4xlat3axNl25N8/4nDZeUzSAlEGJ3LZp940NbdFU/TIFM0j+FPrTMasdnNIsi9ru+USaZAqot7Gn0Rtuf2hmMDI0siw4u5QEB0latvol451TgQHgKLiyW7aq8Zm7N+loUh9mdgCc0ejIwAT7nj/4j8sZeRinv2nZvHgaolWNGwFi2RLFW+rvmwu/MVBonmc6c1p/C3xTs2UQJUt1rYV0GRnuKSjpQD5tF2ldUJRrg8iaiDfrouXD50YoSArgA25pjV0z4eKTFqx3bsbEb2wRUXRyPMI7jvh+hQ3t8wHwW6h+dMnZDLIoW0YxV2Rqoe3JIRRCMtqTlF5k/OvdUYLTzu8zURP9QeZHubcMPo+0Cy8qUmNtWgxM7T6iuK4Qvf5jrwIuqDIzywt3KtvYcNtUxsW0X+uVRh+Y
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(26005)(6512007)(86362001)(66556008)(2616005)(31696002)(8676002)(66476007)(6506007)(44832011)(2906002)(508600001)(6486002)(53546011)(186003)(8936002)(38100700002)(5660300002)(316002)(66946007)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nsUxOB+ncn70rloFHMkBuCa4gdu6RbqxPwb+sE/rjaFobMuJ+bF00C63JKNE?=
 =?us-ascii?Q?Z6oxAnLDR+u5sjmdLA5M1y770qeqSdHkv6ctF3FOnYM2QyXdhe1n5NlPI6Ed?=
 =?us-ascii?Q?acoUx07APqJdZXTgs4iqOy2ZiWuT4mAoPY0sKnSiSW3JDfB/3M0ylAkjkhi6?=
 =?us-ascii?Q?LM7j/TEHb71cwlWA9Jk++U7suDy+ylIJtIrUDBGNiQTGR5i0/oGEegy8+OSS?=
 =?us-ascii?Q?8/C7mCNSBzn8qi929wsNhSmR+NUp7hNY8aRdtz33pTiZ1RM82mYVNFZ6Znk/?=
 =?us-ascii?Q?J7zKF2XHKJHJKN4KljSO4cbCBREEAsZ5g1XNiHvhvXlK16PP8gPRxTUSoNfK?=
 =?us-ascii?Q?70dx9x7yEfInbBpDs8uoM9uNWFl05b6kqd3kADQ8auo3lFZRX3bA1NJQsf62?=
 =?us-ascii?Q?NV55r4X4g8iJRrekrDewhxB+ZnVhpBDdIvScm/KzZE4K/M7PQP7UnqT/as+D?=
 =?us-ascii?Q?HIwJUOsBbbsNTCMDwFtEujP+YBZQClQMVGydAEFx3zIra7NTpYHSsUZgHLTR?=
 =?us-ascii?Q?byQ4gdz4R40BGoRqqg6gJ8fVf5g2o8bO/oYrJMYDVJl45BaE5og3NKSmr64E?=
 =?us-ascii?Q?XJNDoRBlqDXNMd4N6h8VtwUdrtM9xWuxyHJNOTmamVEshRYa1qn7Grg19qvz?=
 =?us-ascii?Q?MK58RkLH3k9TybHm1jJKx2gPt3fJAy4PAjtJfaVM88vz1XccAW18t9G1xtkB?=
 =?us-ascii?Q?iyLb9lLA8NLuEJpZxIz/0G08gLr4jEUhZRKBrel4xtZXrtvatqyPR2N+tLca?=
 =?us-ascii?Q?c+IGQYNcmUY0HTY9swvRjM5fQ5bnoJCdXJjto+B6LhtkdPUsb4WqcbK1NoUo?=
 =?us-ascii?Q?4io+mSGyFbNadtJob9ptjA1keWm05X2dK6xEgNs2pdMN4i+kCTNC5jTh+AeI?=
 =?us-ascii?Q?aUcVckVp8DAUwqw9E62MUPVvhbWeqYvxubvjRCWrzkLD2bHQFux8ZmvUo8L+?=
 =?us-ascii?Q?P80RIR89moA04x3MLwivKLjzolRVsfkjbObGi+A8f6xOCJ9p+eav1d0PU3Zv?=
 =?us-ascii?Q?R9NxglcIl2oI/L0jsgE2HONURlpd5IuMAim/E/SSyFHL9C7VulGKKFi7BMgT?=
 =?us-ascii?Q?W8AP8uk023SoLIzbnXIxtPF4xVO4GH9MhkkcDvkq1N8ZHlIsQ0f3CR6cWaqQ?=
 =?us-ascii?Q?pZuqyKajIXYMcGI3aiRL26GVZqiEICDxliHaPUk/xdr7HYy38vm7F/tZyXxI?=
 =?us-ascii?Q?IZBCzbjKGENVAqWtuHtuqtkAgsVYRV9+bVdMk3gWZnFlOGkztNRegFfBWIMn?=
 =?us-ascii?Q?eulPzhGdSJJ+SZqvYMLyGSATX60XgzQC2/ZmZAylM1RYiHRIA9SimQhRvfh+?=
 =?us-ascii?Q?8pCiLOxeORNxgKuWpqvrI93S1LdaO5RxtTKx+V3D87KQDHWM7Vsco/Kl7oyA?=
 =?us-ascii?Q?cb9MMVCKkY1gRhPvBMRnoSKSdkCrl0ODGJmJKcxie/FT1SC7CvlqfT5zMgjp?=
 =?us-ascii?Q?g9UUbuKolNsIfOHtPT8Nv910p1qhN1god5L9fOMlk0HAt9NeJ4hJEU06RFkG?=
 =?us-ascii?Q?u8Wow+XjPG+joYngAxvO0M/MYy9oKEoaIIae/HpOdUd1rrTVNQGyAXHejlAr?=
 =?us-ascii?Q?KgiA6Ky7YiIXo5TUgkdUMreDBrpg/s1MDnAAnlpyDR7qso/pXSa8NDoOTeEN?=
 =?us-ascii?Q?r3vHVW2fRtoRm4LhA/Ei6/eIK+qXjGXFTpCN96EJm9h12+lvX34/d6079FdS?=
 =?us-ascii?Q?JnN4R8aEb2OWYXxcpDPjHEJce7XuxERgTdDyZEEesK4Gy/AMWLRbrBSJOztp?=
 =?us-ascii?Q?hT6xGIe3m4WrneTa196exngf8IZ43Uwrfn5A/eOL34J6IQjDOopk?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 054601f9-86fb-4123-47a0-08da3c9676fa
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 08:30:16.6002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 oOOiuHbuMfXwu9IibOJk3+kxfQG8L1t95HTl7a2Wd0crNvO+Cu/iW5qCk+AFcoNbMIVcQwJ6fsLD1sOzafNx9qJPNIx0fszXizwEx0qcDIWjCuoSpY8El5lhyc8ar4Rr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6229
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 May 2022 08:30:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2944

Hi Michael,

On 5/23/22 10:28, Michael Opdenacker wrote:
> Hi Quentin
>=20
> Many thanks for the review!
>=20
> On 5/23/22 10:20, Quentin Schulz wrote:
>> Hi Michael,
>>
>> On 5/20/22 20:35, Michael Opdenacker via lists.yoctoproject.org wrote:
>>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>>
>>> Fixes [YOCTO #14590]
>>>
>>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>> ---
>>>  =C2=A0 documentation/dev-manual/common-tasks.rst |=C2=A0 4 +++-
>>>  =C2=A0 documentation/ref-manual/variables.rst=C2=A0=C2=A0=C2=A0 | 13 +=
++++++++++++
>>>  =C2=A0 2 files changed, 16 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/documentation/dev-manual/common-tasks.rst
>>> b/documentation/dev-manual/common-tasks.rst
>>> index 3a47a9ff27..ca6d594386 100644
>>> --- a/documentation/dev-manual/common-tasks.rst
>>> +++ b/documentation/dev-manual/common-tasks.rst
>>> @@ -5481,7 +5481,9 @@ system needs to meet the following requirements:
>>>  =C2=A0=C2=A0=C2=A0=C2=A0 variable.
>>>  =C2=A0 =C2=A0 -=C2=A0 Include the name of the :ref:`wic kickstart file
>>> <openembedded-kickstart-wks-reference>`
>>> -=C2=A0=C2=A0 as part of the :term:`WKS_FILE` variable
>>> +=C2=A0=C2=A0 as part of the :term:`WKS_FILE` variable. If multiple can=
didate
>>> files can
>>> +=C2=A0=C2=A0 be provided by different layers, specify all the possible=
 names
>>> through the
>>> +=C2=A0=C2=A0 :term:`WKS_FILES` variable instead.
>>>  =C2=A0 =C2=A0 Getting Help
>>>  =C2=A0 ------------
>>> diff --git a/documentation/ref-manual/variables.rst
>>> b/documentation/ref-manual/variables.rst
>>> index 146af89e8c..ce2b6bf68a 100644
>>> --- a/documentation/ref-manual/variables.rst
>>> +++ b/documentation/ref-manual/variables.rst
>>> @@ -8767,6 +8767,19 @@ system and gives an overview of their function
>>> and contents.
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 previous example, some-nati=
ve-tool would be replaced with an
>>> actual
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 native tool on which the bu=
ild would depend.
>>>  =C2=A0 +=C2=A0=C2=A0 :term:`WKS_FILES`
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Specified a list of candidate Wic kicks=
tart files to be used
>>> by the
>>
>> s/Specified/Specifies/
>=20
> Oops, fixed.
>>
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 OpenEmbedded build system to create a p=
artitioned image. Only the
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 first one that is found, from left to r=
ight, will be used.
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This is only useful when there are mult=
iple ``.wks`` that can
>>> be used
>>
>> +files ?
>=20
>=20
> Indeed. Good catch.
>=20
>>
>>
>> Looks good otherwise, thanks!
>=20
>=20
> Great, can I add your "Reviewed-by"? The changes are now in master-next.

Sure. Don't worry if you forget it sometimes, I don't care too much=20
about them as a reviewer :)

Cheers,
Quentin

