Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49397D44D73
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 14:04:07 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.45])
 by mx.groups.io with SMTP id smtpd.web11.46202.1730901841789437907
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Nov 2024 06:04:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=h03+vvd+;
 spf=pass (domain: cherry.de, ip: 40.107.241.45, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a+rsS0dviEx0u/jeVYPjK0ypRhVkGE168XKpBg7DBCnTq/cd8k6/TtfU7RbgZ183ZxECSXobIRdu6r8jozHxIEeVqB6R3zX4k5fPubf8/CCybXXczntJxZIGL7epr4U6njPii/xTYhKvSEnV5E8g9NLhxzXuXmwPlWgox63882NoKbjdRr+YGaPuofLHKrT7hoNsu3gKetlbannMy6vN399IxwolE0knklPEJj+Zh7RjETnoG+6EGNOYrozL910Zbc2kuoai8VqMNFdgvAJOB2KhexR6LEJpMHJIlMoZAfhyskHkUyo0aVZcFbBGCvhwbGifRJnEkTv3A0JfYS2kvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qplhEMIMZwqn3K7qsfQn+I3riXguf6dYp2BdPgH7H2o=;
 b=EQtwgFMDxOMCWFBY6qMnbrz5c7lcZdCvAhehEYafqdRnsl2SFk0qb/D3A+4hveiG9wXcOyJK4y10/nARe+6K0j1ALOpPWyURJ+2zuRj/jpV5l9y77LOMQh7qRSiAI/h/NGEISGLOn2Ms9LnwAZsB2B8VPYFe4euhwJfAzFInDHX2AKIrTtQKlc/iTuEJ73Vcgu/muX6BXDGCosdFU1gKGhzPmAXYt/8WtD4jK/aXsTeD+YqB3aGOMMqcOVVfecTgR9q2YRjWcyzBc+HAz4zEw38pTiWMKOgI2cRR/8t7NbCTojZ6F+nHkrt8o6rcy+kUA9Cr+ZXV3daSp88iEV6HzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qplhEMIMZwqn3K7qsfQn+I3riXguf6dYp2BdPgH7H2o=;
 b=h03+vvd+/GNDHpfmmxDpnECmvvO/S3iOsA2FSsOFqNGtHvmw7p36Asg6LjmoulMx6K53o62/NH5H9YD8Nuwt9f2WSxOQsNcUxlbjFdzelsx22HDSo5Qts40QuuK8bH7mOe7RmKSRJnw8ZkNAwee5VQBTQGPCtJ0mCke/KyALYAY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DBBPR04MB7610.eurprd04.prod.outlook.com (2603:10a6:10:1f6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 14:03:52 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8137.018; Wed, 6 Nov 2024
 14:03:52 +0000
Message-ID: <4d73ba52-0c3b-4683-b8fc-a6472e811664@cherry.de>
Date: Wed, 6 Nov 2024 15:03:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] release-notes-5.1: add download section
To: chee.yang.lee@intel.com, docs@lists.yoctoproject.org
References: <20241105014204.2824698-1-chee.yang.lee@intel.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241105014204.2824698-1-chee.yang.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0437.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::7) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DBBPR04MB7610:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e408439-6f61-43db-9f82-08dcfe6bd84c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Z1A5UlhQQ3hEWXNudmVKVCtacVpsT3hRY3JjdjYyekFiSUFjbmxHNTRlM0NY?=
 =?utf-8?B?RGd2REh1MmF4dk5WY081WjV4TE1OdVZLNStSSGRYeUlRVVVtV1hHNFZWbkxQ?=
 =?utf-8?B?NmtxM0NxZUdBL1ZDYkhucW5MNmsrcnpSVmkwbGxRODIyZ3l5bVd5Z3hTNE1U?=
 =?utf-8?B?NXdxeXozMWN1SGVEZVZDSlgveUtZRGlXTGhDa0tEaTdFc3ppQVJkQzJ4N0x4?=
 =?utf-8?B?Q3p5OWNBb3ZSZWh3NE5Ha0FGRkovbnFkWk5xaTNKZmJFa0FndGN6UnduS283?=
 =?utf-8?B?VVZRTHI1WVNPa04rVHlXN3NxQTY5RGpDNVFEVHY3bEhWQ0ZzaG5WZ1dOUjVo?=
 =?utf-8?B?SC9lR2VtdC9peTBVbUh6Yk5FYmRwd2hCY2prbkhSRUE5d0o0d0xxaHU4Y3Uv?=
 =?utf-8?B?eWtRQlVGNm1HU1BydVVwc1NncW8zVmh4RG1GdUI4NDBRZU9xS1V4L2N6Y2V1?=
 =?utf-8?B?L1U5S0g4eEo0a3JyMVgrT0svYk1scUw5c3F6N2lKT0NvU21TTDlXRmh1cDEx?=
 =?utf-8?B?SGxqMVVzN0VoaDF0VEZab0xRdmlKc1lYNk5xY1dmR3BMTFgyRjFaaHU3YjBN?=
 =?utf-8?B?eWNpUi9SN3BYYlNEbjVnbkhjWEdpVzhIVXc5cVNOYlppQVgwUENuY1dnSUFV?=
 =?utf-8?B?aHJBZW9NK3A4RFR0dTc4Qm5wd0xQYVdTZGwyQnY2OW0wcVFDS0FNVDFJR21m?=
 =?utf-8?B?d2Q5Zm5vNk8wc3pWUU5LTnNyV3FCMmdUUzh3Q2djR2loeUxOcjE2NnFSb3B0?=
 =?utf-8?B?V05oazkwakxrMVFSdHlsc2FTQUNXazU4OVZ3R3E0OWdZUnd5SkJyN1ZJTW9z?=
 =?utf-8?B?VU4rNHJVNG1MU053anQ5bmpiZGp3SndFU3UxejVyU09uVm1ES3VQeThhQjZp?=
 =?utf-8?B?Z21zUndkbFFnVlF1OE92VDkvV1BPTWtyZzJTc0NneE1QRmdhczV0SzMyMEdD?=
 =?utf-8?B?ZzE3TndySXZrUUJCdFRtNlc5UHJkVGZ5OXFDcEw5RDJvZ0VONU9WeVJWQS9u?=
 =?utf-8?B?aTdKOWl0Y0hOSG1scnd5RWQrdHdySHFRMENJb3dzanBXTEt0TzlwMHl5ejJ2?=
 =?utf-8?B?ZXI4UzZQMG83bzFpcFgyWnU3Y0IwUHEzOXRrdWx3TTJtOVVmYkN3SEFZNHE3?=
 =?utf-8?B?VDB0RUZQRDdwb09QT1p6SUJ4MmQ2SFZYcklvWWh6Z1ZGdjJLTGFSNGJjcTBs?=
 =?utf-8?B?a0NpNzlTbHUxM2loNnphRk8rM2hxZFJpUFZyTWY1cFlNeTJjd1ZqcHR4YjZR?=
 =?utf-8?B?WDVwU2dJNEhIdUZNMVlJeE8yR1JlVGRFYW03eHV1YUVkZFcwc0Q1VEhCTWhj?=
 =?utf-8?B?c01Kc0IxVmM4dlBTQUdzRkhEVFZ4elorUzg1eWllQjdVczhPd0k4aGdBYzRt?=
 =?utf-8?B?SXh1RDJHb0lVS1lVNW91MTBtY1lrYWhuVStXVkNxd25YZ3hBdExNTktLUUti?=
 =?utf-8?B?MWNiUlpPdnoyemNYODM1MTJxZXBTdmw5THpmU1BOZ0JYUlB6TFhsYjJNMVl2?=
 =?utf-8?B?Q3hhRVlPTVNiOTF3NGhsUVRzc1RqSlBWRkdVY3JDRkJxbXh5TnBpc3FRME9L?=
 =?utf-8?B?QnVqT2E0QXpWOWUrMGZrRURRZnluZjBnaSs5OE9FVG5rc2dxKzZySVRHTFlu?=
 =?utf-8?B?TDBRZ3ZLSHRwTlFlL0xoN3A4N25XODQ3L2s3S3J3WkxmTGpCSFhqbHVKeE14?=
 =?utf-8?Q?lUhL7HAEh9HpLBOx+IT+?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RGJFKys1ekh1TG92U0VEUENYZEE1OTNCZ1RidU4vR0ZiQllDbWlVMkt1RDVQ?=
 =?utf-8?B?YnRLQ1B6Ynh2dU12WTBpbDF0aXBVTUFPRHdTVnJROFJRSFZOTTRuTjlNbTY1?=
 =?utf-8?B?dzZ0NExlQTNGZXYvVVlvWVoxTmkyOWwveFVicDlHVys3WmF6cXJoa0pWQUtw?=
 =?utf-8?B?dWU4VGpUSDFsNGxMWG5rQmd1MnJ6MTZVei80ZHlaMWpNZUN5VVVPL0hVcTFr?=
 =?utf-8?B?cXBhVC9sTVMxaC82SDNyNjAxL3dBQUdNMzVvZXYzOXJlY2dDYUErQ3JvM2J3?=
 =?utf-8?B?T3paaUQ0RjErNktWdFRWRzIyMUg2YXcyMThuREtsVWI4NURjc2ptc0FZbVBO?=
 =?utf-8?B?WGx0NFJZem9DcnpkVmVsUXdaYjNNeFJzbGNTT0IzM3lLYzdYM3l6dGNIa2FH?=
 =?utf-8?B?M2FCbmpEak82NnRCTFEwMC9kVDl5N3Qwb0hKL2Vici9jWUJsTXNBS3pabUVy?=
 =?utf-8?B?M1hEbkRYMnJzQlVnTXRic3EzT3ZlZGVMdG04cFlTbnhKTHA3Y25nQWNkcjBH?=
 =?utf-8?B?QmhVRTN1TWxCUnVSMlp5RDdxTmJ2KzM0MUFaY08xbTFhbSt2ZjNTbkN5WitM?=
 =?utf-8?B?UTN4Yk5QL2xaanFUbTBqSjRvQXhUSzYvREVMZDhTY0JpSjY1L2NTYWI0SUxi?=
 =?utf-8?B?R0NDN1ZKNm5TdUFiWjJaT3l2RENybVh5aWpBMDF2WEV3cjc1c3NIUlVGY3BB?=
 =?utf-8?B?OE1SaFNLdkZ5QUUvdXhMSTB1Yy9wR0h1NWtPNFMzcXgvb0VuMWFlZXh6MGRz?=
 =?utf-8?B?NjZQRkh1WEM3UkJaWE9iUHorUklEVHlDL1pYRDYrU3REQkpLcFFlNks2cDFQ?=
 =?utf-8?B?Yk92MElFTFdkbGQvZDNxMWZvYmNmV25TY21hNHhCTnhWQkpLKzZVQXRWWDVj?=
 =?utf-8?B?SENDYnZrbVluSGpvTGp1Z2l3QXJ6NkdJdmRxd2VmZG91QThsYUkxNFV6eEhJ?=
 =?utf-8?B?Y2QrY3U1NDAvS0djVGFXQ21OWENyQjg5NGtONDFQRUZsVDZYcGdTODdrTlBW?=
 =?utf-8?B?QnErQjJLK1pjWVlSSmtQYjlLdGozSCtvL1h4dEFHNFZnSDk0S1dRZGU1ZzYz?=
 =?utf-8?B?ajJFSkF1MU53ZXZ3S0VJVTJIeXAzVkFiOXVJdjlKajV6MUxIaEQwbUY5bzRF?=
 =?utf-8?B?dUhIS3VmcUwrT244RUlpR3hFWmRRWjMwa0psNzdPUXZTMS9VeTVOVEE1c2ps?=
 =?utf-8?B?Q3B1bGRqY05CUVozS3FEYUx1cXN0ZUFNc0t0SlVhZ1RaR3FrV1k5TER5SzBv?=
 =?utf-8?B?VHhUcVlBNXBQZ2c5ZjFNM29rb3lJSDhPbGZpS2Z3dy81V2Y2OFJac3R5bTZi?=
 =?utf-8?B?NGMyV2ZhMy9NbmdYTVI0aFE0V2UrWFJ2Sm5rTlk0ZmM5SG84N2Jta0Y0NWlY?=
 =?utf-8?B?Z1docW1rcEJxZUdsZkZzWnp2Qit4NWRGWVl1MXFlZDVtS3hFQnJZeldPWGJM?=
 =?utf-8?B?eXpmSzYwZVdYU2xxUEhvNGQrL2FjSnlHVzlLWHAwaW45aDlsUlZQcmxyWThP?=
 =?utf-8?B?MXc5U1RiNzVtbmtYckdteHhpOVMvNS83VUVmenFRK2ZKNGFFMHVyY0JOR01C?=
 =?utf-8?B?bUxaSzJUUktsRWxXQzBHaWNpNkFmNC9tdnpZRHNkV1NjQVBidXVjdHhLbFh6?=
 =?utf-8?B?MHZyV3pTZWo4TGlkRkdYMSs4eXNudE4vT2FoYTZ6eGlwVjlrdjg2cTU5b0tR?=
 =?utf-8?B?ZnZiS0VOTHlhSUorMUtZUWVnaWRvYmVvTjZFc2ZDbk1RdWp4STFhaGEzOUt4?=
 =?utf-8?B?TnVySC9ickR0bHU4NTkvTnd2Wm1UM2Rra0dmb0k1dFdnUlVicklUSnA1RS9z?=
 =?utf-8?B?bllkRmNEL2JGRzNQbWJEOE1RTU01YXRjeVhsNXZxL0VrM3grVkdlM3c4dVNs?=
 =?utf-8?B?anl2OGc5VFU4OUErYkJTa2lpTXlEeVJpKzd5OFVXdEQyNDRmbXFCam5GQzhT?=
 =?utf-8?B?UFdyWVNScU9EMXp6Y2E5TXVxNFRYUUpZWlNwemsxbVhMTmVPUmhoR0xacHo5?=
 =?utf-8?B?NDZzS0w5OTRGQWpVTXZreFRNQWljNVA4bXM2SWkyN0lZcWo3SVpwT016UkZE?=
 =?utf-8?B?cjJBbGYrMVhidnQ3N3l3RWFnVXR4RWxSZzBUN1N6dC9TL3lXVGszUDQ0dEZy?=
 =?utf-8?B?MlBCdjZodXUyRHBJYi9sbWFVdktuMWJrZTNSa3JCR0ZXMmMzRysvd05IM0JY?=
 =?utf-8?Q?Q+m+hWOCGeTFl9MHb8unjso=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e408439-6f61-43db-9f82-08dcfe6bd84c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 14:03:52.4927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1C+DN/YaKXhgHCG/Vw/yqsxJFGxH6dDWupnVngWM73tCptIbDZmDyt+KKPprFjnwvncaCW5tXEOK/sL8O5pVZn7UwB/G7ZfrbBkIOZy5s+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7610
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Nov 2024 14:04:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5702

Hi Lee,

On 11/5/24 2:42 AM, Lee Chee Yang via lists.yoctoproject.org wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
> 
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>   .../migration-guides/release-notes-5.1.rst    | 56 +++++++++++++++++++
>   1 file changed, 56 insertions(+)
> 
> diff --git a/documentation/migration-guides/release-notes-5.1.rst b/documentation/migration-guides/release-notes-5.1.rst
> index d6e284c1e..e5da4eeaf 100644
> --- a/documentation/migration-guides/release-notes-5.1.rst
> +++ b/documentation/migration-guides/release-notes-5.1.rst
> @@ -1018,3 +1018,59 @@ Thanks to the following people who contributed to this release:
>   
>   Repositories / Downloads for Yocto-5.1
>   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +poky
> +
> +-  Repository Location: :yocto_git:`/poky`
> +-  Branch: :yocto_git:`styhead </poky/log/?h=styhead>`
> +-  Tag:  :yocto_git:`yocto-5.1 </poky/log/?h=yocto-5.1>`
> +-  Git Revision: :yocto_git:`8f01ae5c7cba251ed25c80f0141a950ebc8a5f73 </poky/commit/?id=8f01ae5c7cba251ed25c80f0141a950ebc8a5f73>`
> +-  Release Artefact: poky-8f01ae5c7cba251ed25c80f0141a950ebc8a5f73
> +-  sha: 91f5b2bc8a2be153ac2c358aa8ad71737b4f91e83d2c3ed1aac4f5f087991769
> +-  Download Locations:
> +   http://downloads.yoctoproject.org/releases/yocto/yocto-5.1/poky-8f01ae5c7cba251ed25c80f0141a950ebc8a5f73.tar.bz2
> +   http://mirrors.kernel.org/yocto/yocto/yocto-5.1/poky-8f01ae5c7cba251ed25c80f0141a950ebc8a5f73.tar.bz2
> +

Can you update your script to generate HTTPS links?

Thanks!
Quentin

