Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A44AC7EE2A
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 13:55:00 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.13])
 by mx.groups.io with SMTP id smtpd.web11.20293.1750686890155853688
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Jun 2025 06:54:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=hMHq3Et5;
 spf=pass (domain: cherry.de, ip: 52.101.69.13, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LocUSLwyiyPr+DXo8qO43DqqjEnRTXWQ1nx6onqYJnA6/rPQ7LH7V7eusl6g0NxZeDfadVyj3NT7ymH8vhB0EPXOg+/mngIDBSznplwKN3F6NPq8BMaBpn3XxogITAHijsVMVR1BHai7qmwZNs07qAO1kLKuMCo8AwllOjoiR6iHQ3ZDsO0sJYSMdaTHFaMT6M5/3OiTuoVmkQN8MPOdWC8gQcMSnW2KbOY6G50id2odeDAdvmCsozGqHsiTh1l7o8/yXoL2thD10t+BM4i1bGHlWCj/+6pPw3qS/9Lqbg+vdiLZyhVA74s+97BD768l1xZnNsx+EEekIHL+OLB39g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s8zvKErjnD1d5F0J9OCVzIFZcQKXq/KiuOT/mltYLFw=;
 b=rpaxqOYPoLSL3Ev97ezZghuHkSsyVA7bzme/euA23HXmGdc+P+MVPLuSwwM+o8mf5oola87TftMF62jutcMlYc9G/d++w7/uO5kJhjtmH6iR/lcrfP1prVVkRN+gta2pwqerZZHfI33pUyr1Ls/IlrKuixL/Zp2DwE5uG5eQEzxSl1WZmUou2sBLiOR+v6Ch3acbR1JC2ZGb0koe3R/30uGSecB/uS9vdhZSHNolnfZqrUy+wHgWQx82ohn8JV39h24vwuGEKdaEK1PZhkKgY/ry/+fgPNdRBdLQjskqmyis32Dyqp4JwcsY7iDTwHmppCqdzQ9P9tvs66KpimrI8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8zvKErjnD1d5F0J9OCVzIFZcQKXq/KiuOT/mltYLFw=;
 b=hMHq3Et5bIKI7P2ONAwSvA/BiKfPe4tVel59HqayU2SGqEQN0x9G74TEFazH9Ocqq+vQBzZe3z6z+qFJDGNB3IQWzEm/BdaDjytJl+/Ct0sSNny42K/pFfvfKb0YjoNPM/5qgCZy31FbaI2MCtNIBogyVuVnIHdKqkjekvHu+Kk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GV1PR04MB10944.eurprd04.prod.outlook.com (2603:10a6:150:210::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 13:54:43 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 13:54:42 +0000
Message-ID: <ac232b79-cc65-424a-9fa0-54e25c831ce8@cherry.de>
Date: Mon, 23 Jun 2025 15:54:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] dev-manual: add real example of
 "bin_package"-style recipe
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <3b0e77d9-f64b-6238-ddc1-375c082ec3f8@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <3b0e77d9-f64b-6238-ddc1-375c082ec3f8@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::16) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GV1PR04MB10944:EE_
X-MS-Office365-Filtering-Correlation-Id: 85da7489-5cd8-4048-c7cb-08ddb25d8148
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cmRKd3BseXI2ZjF0NkxCYWxPelR6SHRYZXQ5TnQxYXY4V1Nna2N0MHFnWVl4?=
 =?utf-8?B?VDdTVnBuRURocTdocFFYRTQ4NVYzMmd2bUJVRHZWcjBIemVzSXl5WFgzeFF5?=
 =?utf-8?B?Ujd0MW04dFZNWGNjT3dSMitVUjlTQlZPT3NRUkgxOGRpUHFZekc2MDNTRVhu?=
 =?utf-8?B?aUtkUUx1RkJpSEh0UnN5WDFJZUJFVXp4ZzRLSEpkaW9LT0lmZTVITmtHaklE?=
 =?utf-8?B?dVFHcHJDeWhtS2FqMlViZEExS3l3eWc3QW5qWDJoTUxZQ3dLbXU2UUl0KzNM?=
 =?utf-8?B?M3NJbFhRcnZvSjJaUTZmSWlIMjBqQjlTSmV0Mzh0TXhzbGJ2UHRCeEROWW5T?=
 =?utf-8?B?U2ZzNHBXUUt0WjkxMW9qNWJiWkpPSzdXcFpPS2cxZ0ZpcnlRRGJ5WEtxTnN5?=
 =?utf-8?B?ZjQyUVhmTktaMnFUbG5KZncvVXJvY0J3RlNxK0lSYXNTM3MyREFtajJNY2J2?=
 =?utf-8?B?SHNRNmRmN0hpWDUwMzEyWHFxTUlZbVc3NWV0QUUvZWFUczRmT2JpZ2dkOSsr?=
 =?utf-8?B?MUxqbStyVXJ4L0NSNFBRK2Fhb2ZMNXdBU1JURmZacmY1L29RcHJwZCt3Q3hu?=
 =?utf-8?B?ZW9aWTlyNzdWYi9QbEY0WWJPdloyZE8wQ0dUTFp5bk1NTFlDU0pEei9seTA2?=
 =?utf-8?B?Sk94eG4rZCtwU0ViYTFNMElHTmtlcVhzRExQUDdEK3dUY1NHejFEZ2hhWkNB?=
 =?utf-8?B?aGlubzRXRmduOHRKODFFMFVaSkgxYVRHTVZjVUJ2Ymwwdm1lT3BucDdYTy9L?=
 =?utf-8?B?ZHo0VGE0bnNhS1hqUjA0cGdkVCtNT2tlR0VCRnhWWmsxWll1SjkyTVcyb3VN?=
 =?utf-8?B?ZDJnSGM1UjJ6QXY2TGIvV2pwUjRscS83cERSSTM4U1F3djIvbUpEZkt4cVR0?=
 =?utf-8?B?Z1NVbDZaV1E1Nnh1OWo3VnNXdW5CNVNiRmlBM05kdXF2Q1EvSmlaN1ZUOE9V?=
 =?utf-8?B?dFpiTmdMR0lySGh3VkUzYWl2NUFNQituUnpJbThSWGw1emNpd281MTNYU1FH?=
 =?utf-8?B?cnp3Nml0N05hYytjcXU2MGtVL0J2a3J0SWNGbmNISTh2b3locXc0VVRDR1VX?=
 =?utf-8?B?YXFjbkRFRzlOR3FXc0lLWkMyYXBSZ2J5b3M4NEt3UlZORVNkNC95K3NzSTMr?=
 =?utf-8?B?bm52cGVKN1ZwQVhRQ0RHYXVlRjlhZmxmdnQyaktIWDBVQi9YcEcxbDcwbi9i?=
 =?utf-8?B?cHRMWmw0RjNnZytGbkM0cjZxZ2x3Y2JyVndCOUdQZjJTZWUyUDRzNndXRGh5?=
 =?utf-8?B?emtqNm9hV0ltbmtEUTRXK2kydkV1ZDhLRy9UbjJPYzFBeTBQQTYyUEcwUFAz?=
 =?utf-8?B?YXdTUVpLVmVhZnk3eGsyVlYyK0J3eG1EbThIbVVVMllnU1ZBa2g2a1V1NWN5?=
 =?utf-8?B?dHpTdy9XTENLMjNIU2pRSXJCUU9FNi9DWGtoOUJtV28xSlRXVTRKQ25ZSU5t?=
 =?utf-8?B?MG5XVDlyUUZmdksvdFNmdU45Q3ZuK2tIRVBYTUVLMmhBOTFvbzRyN01BRmNX?=
 =?utf-8?B?TWhpWDVWSkFxanVJNDNLM0FhZTFhbUZNcGx4aG5MUW15My9LdHBxQXJ6S0Iz?=
 =?utf-8?B?Z3JPVk1tVitnaE9Ba0V3SW9NL0VPc1JNbWRwZFl5MnVnMXIvSU4xU3hFSUlN?=
 =?utf-8?B?Q3JjbDJ3Rlh4amw4R1ZRank1aDREaUJjM0MzaUFRbW5TUmhwT3FPZW9zY2Zu?=
 =?utf-8?B?NDNGREh0UGVoamIwbDFzdTdzb2w3eUZCYkFnelZCMUpVdkFpUGUxQjNvaWFM?=
 =?utf-8?B?SW5XOXdxRXFidmhVNUVNSlpQZXd3OWdwVG1OMkV6REN3SHNpaUIvYTh3d3Bj?=
 =?utf-8?B?VldYYTkrVHVENGRZUXBOWnp1L3BEK2RlUTlRK1ZhcjgwNk5ZR3MwSjZBMjd6?=
 =?utf-8?B?NkRNQ291cFN5dlM4L2lXYkljTUZLSkIyY2tRdHFYaU9VVU1rTVNreiswZDNR?=
 =?utf-8?Q?dsk6EkH/YRI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZmlQakNoN3JLTzFCYnVoNkJjNUJ5U2FUNGZ2SXhKc0NKQTZqeDFGdWw0RHI4?=
 =?utf-8?B?UEJST1NmZFo0VElvRE4yVkdWMkFNNE5wMm9nT3RRMS9RZXdhLzBVb3NrVHhx?=
 =?utf-8?B?VTZad085V1JiMkdGcG9NWm9kSnFXanZVOFVxU21ocVF5V0pQWGVONzlPUHZm?=
 =?utf-8?B?OGJmcHJxVUFIeFEydjBGR3orWkc3TWN4QndsTDBoM3U5N1VqRXM2VXlvY1pM?=
 =?utf-8?B?dzhjb0pkQXhnYkJYT3BjbHdpY21jZnFPY2VZelZYNUdmajFXWlZNdnNpSHVG?=
 =?utf-8?B?N3J4M0o5dDNRV2pLcysySTliVU5iU0NHdXFiVXFJT3YzUTcvV0JTNTJkeUpm?=
 =?utf-8?B?NzFFdzhQTWVGQ08rUUFJUkhqYzdXaFU0aHNhUElNaHJmNnd0WHlzaWpKTHhk?=
 =?utf-8?B?WE5XTlozNTdxUDVsZ2d2Qk1ueG8zUkEwSlZ2ODhHSHlSNW9sN1RyMGlIMXlT?=
 =?utf-8?B?V0F0QjBMMFl6NjREQzg4dVYxMXhRMG9yTWxDNDU1Q3cweFdGWlU1b3JLK1p5?=
 =?utf-8?B?UVduV0ZENURTY0x1RWNjRFhIOU5tVXdPenlBSDRkbVh5bmxmNjFVRW5qb0ZI?=
 =?utf-8?B?MFZwT1VQSHEvOW1RM3hsQXREdm1XcC9FNmZvSTQrTFFlaVlzMkJTcnJiZHB2?=
 =?utf-8?B?clg3Z005N25iWmVvUW9lTUVwS085bk1Ha01PVWg2b2VMVU5NTkJUTTBEUWt0?=
 =?utf-8?B?aUdtWmNRTjhyQ1F3dHR1SkhrTDZZcmZKSWJOU2J1ampvVndnQmpjS1d6RmNo?=
 =?utf-8?B?QllCNFlxNXpoMGZaUUhteWRjaXI0dG11MjZYRnZob3VUemRyUmg1b3FMWHl3?=
 =?utf-8?B?Y2VPa3p2Zmx3OWtnNm9CTDduNXJ6anVvK2NHN3ZsMEtiSTd4Q1hYUThTVDVm?=
 =?utf-8?B?Wm9rdExjeThEZ3FhOWZlNS84Z1BVR2NVdTBOVU9Hbnh5cTFVelhGenVJQllQ?=
 =?utf-8?B?MS82MEZ0NEVPY0dGdEgvLzc2MDAyeEEzdHliclRHRXQ1NWtlQTZBRGpnWVZL?=
 =?utf-8?B?eW5TenVQajBobmRqeFE0Nmd4UFhFSWlMQUVicEYwemF1dldDN3ErT0JaZEp2?=
 =?utf-8?B?VHNPVFdRTXlCc1kvbkdRLzRZUmJjc2VsYjJDL3FFWHJYRlg3TXJCSkNzVzJi?=
 =?utf-8?B?Z0JlKzB3TC9WNklFYXdzeTNkUmZadUF2RHJUN0daSkJKREtHWGtzRDdhRW9U?=
 =?utf-8?B?VHhodCtoUit6NnlkMXoyanBWSXlxc2RPSkM1eDBLNTkvOWxuREE2WmhuZklv?=
 =?utf-8?B?cHd0aTBMWmNVMDZCSHc1bDdJVm1nbjFEQVBOWGVXVzVOUzBoZUgvaGgyZEl1?=
 =?utf-8?B?dlNVN2xNeXVOWm1sYUN6WlFTY3VLWTlkRVNtZUg4VlFZTDl6SmpUZmloS0tm?=
 =?utf-8?B?b1F0RjVEZm9LVlUzR2kyWTF2N3U1OUF3dUpkb1hWa2lvSzVhS3J5OXhib01U?=
 =?utf-8?B?akVSajRyK3YvdXVhWlRudTA4RlRrMURsekhrVURVaGJ0VUZha2FMczlzaGJp?=
 =?utf-8?B?VnpyMVRVZjVmZEt4Y3ZIMjZJaGxkTWJ3Zks0ZUNXNTZVZkRtbkZJNEc2TWlq?=
 =?utf-8?B?VE1BdUNUV3FVOHo1WEw3dTdRSjA5RThMOEtpeGNtUkFucTVHQzhJdUQvZ1Z5?=
 =?utf-8?B?K1ZOQ0VaUnNuZXBjM0ZaOS9EN1ZybkpoK3BxOEw1NjZLM3JscEYyYUZBY2Fp?=
 =?utf-8?B?dXF2T0p1ODh2c2pFUkIzaVdUVDk5NU0yM1FhZlBRWUQ5YmJoV0dkUExaT2Vq?=
 =?utf-8?B?cHFkL3A4a3U1YjVtcXUvKzVxM25QalYvVUttRkJlQ0RWMG03cnh4L1lHS2dD?=
 =?utf-8?B?U0hzdTRDUnJlR3M4WkdueEx2OXA1SXRya0dyMnZXZHZlMk9XdU9iWHNvUlNl?=
 =?utf-8?B?NUhDbjQzK0I5OURvbmN2SWlIa0VHME1xS3piUEM4ZWRlWVZtckpDSFZEUFgz?=
 =?utf-8?B?SjhVRVkvQW5Sb29aWlMrVlRuY2pHMFRGbHEwNWVsY3UwY2VyUi9takIxQTVz?=
 =?utf-8?B?b1hzNG5vUjgwVElWMXhFL29ZWlpzV3NSU3RRVVRseHFvcCtIdnYwOUY3WGhl?=
 =?utf-8?B?RTBGY3JOVU9wT2trbnBGYm1DMStvK1NQSjlzSzRoZ1ZaVjN3VDd4SDdSV0N5?=
 =?utf-8?B?WHNTaHo5dmxuckZpQTVxRW5ydzUzT0pGTW1pR1JvZCtCbFlEVEdBTEQweDNl?=
 =?utf-8?B?N3c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 85da7489-5cd8-4048-c7cb-08ddb25d8148
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 13:54:42.8387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A5Hi/FFMO++bDK9WOZh6bzSrN/RKXNGBDQRZRq8szPO0pd2sxF2h1XQNqJ+VL7OoCuonOIa09iku4smMPGwA0nGGf+RmpJFWg0UspnG25l0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10944
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Jun 2025 13:55:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7154

Hi Robert,

On 6/21/25 12:44 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> For the section on "Packaging Externally Produced Binaries," end that
> section with an actual example of such a recipe from the OE code base.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---
> 
> diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
> index c49881efe..5dab196a8 100644
> --- a/documentation/dev-manual/new-recipe.rst
> +++ b/documentation/dev-manual/new-recipe.rst
> @@ -1397,6 +1397,25 @@ doing the following:
>      where you have installed them and whether those files are in
>      different locations than the defaults.
> 
> +As a straightforward example of a ``bin_package``-style recipe, consider

Please refer to classes with a reference and not highlights, so here:

:ref:`ref-classes-bin-package`

instead of

``bin_package``

> +this snippet from the ``wireless-regdb`` recipe file, which fetches

Can we have a link to the recipe file maybe? Considering the recipe is 
often enough updated that we would quickly end up having a dead link, 
maybe point to the parent directory so e.g.:

:oe_git:`wireless-regdb 
</openembedded-core/tree/meta/recipes-kernel/wireless-regdb>`

> +a single tarball of (architecture-independent) binary content and manually
> +installs several files with no need for any configuration or compilation::
> +

Note that you don't need the recipe to be architecture-independent to 
use bin_package (though you should set the appropriate 
COMPATIBLE_MACHINE so that it can only be used on known-to-work 
architectures).

It is not unusual to see patchelf commands in do_compile/do_install to 
operate on the prebuilt binaries as well though I cannot provide any 
example right now.

Looks good to me otherwise!
Thanks!
Quentin

