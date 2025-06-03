Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD14C5AD49
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 15:36:59 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.60])
 by mx.groups.io with SMTP id smtpd.web10.14792.1748965016836019275
 for <docs@lists.yoctoproject.org>;
 Tue, 03 Jun 2025 08:36:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Us9HkZD8;
 spf=pass (domain: cherry.de, ip: 52.101.70.60, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xe+moIgzDa3yts2TbV6FuktplXJDBx0bfscELi41nTm71fIdQECA2tHngRBAeffjatIKKg6Fu/V0zQvIxkKUs7OCwugGdM/W6IQbmqDLWTi6b0j15pWDx+3vWCNhRxfN2l+mOTB8rBOe5AYb7YVdwhRMWpHLUnpl+Gb7U2Sd+cz5ZuBDTgvKxcPz8/e/Rv4DudWxhPdcFVWnix/rmiRZnydiGOe/dh0+eIkwX9e95wzpT3aQeNmn5UXdU254LWBaCtMVIHKWPJ8dpTJZZdHtakiVxLpXXdJ4ahN6QTzGfwp2tz5BCs22ToO1ghNh08Hq7jRssnQQcalZvGvK5l5kvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+jA21mzXNSz0zmzEv1zKL1f5iE7LYjPI75r+U/L+sBI=;
 b=frdFZ1bpiz9GqDsheoy5gVFF+QElAA1H9+ImKgOKyJ8lpb0tYqoRWcCX8vVEccf2stXP/VKacFW0eWII6tjQPY8bMBUgODG7sFTH+S+0crbgtpdkYOZ/xDGPsCHmnkjrfV97PfRT5yGsa7Jf0WNPesTEvvx9Zuj2RaapMFvYijl2B9OmZdLkdcPRRdoV8+bGjpqfJZq0QJD0LW5Nk8zVqu5eXiYymoAl6L8F76oiTflawxOjjfyUAq6cDXxPSv08ZFYt8sfIQJO0hlq5LbiFqWVXp7RG55yq11D5Jy6OqcjeImh1jQvBnnhtgL19FDL+9K3u8H4xI9LRQ4LhtF2E5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+jA21mzXNSz0zmzEv1zKL1f5iE7LYjPI75r+U/L+sBI=;
 b=Us9HkZD8MEHApf0Sll8JVbbp6t0Mnvge+MW0f9F2ozF9WQhhdM0WR4DNU8bqmxpdxS80toA+kje1Fxs/TXTaxPoY7ZpfugC92hplDjGO+feA3a/ey5HG11iZLRWIwuhf1FCqvXIF22xVND1z/PSN4pImkAg7ZonzKLX0Zs3x52E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by DU2PR04MB8581.eurprd04.prod.outlook.com (2603:10a6:10:2d8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Tue, 3 Jun
 2025 15:36:53 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%4]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 15:36:53 +0000
Message-ID: <1b626abd-3ce1-48cc-b9e5-7ba03aec0762@cherry.de>
Date: Tue, 3 Jun 2025 17:36:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] BB manual needs to refer to additional "classes-recipe"
 and "classes-global" dirs?
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <c822a737-732c-1b74-5c2d-5ce8b80b8512@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <c822a737-732c-1b74-5c2d-5ce8b80b8512@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0203.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::17) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|DU2PR04MB8581:EE_
X-MS-Office365-Filtering-Correlation-Id: bc794efb-2faa-4dc9-9721-08dda2b4771a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cmFsVDJTYnkxa25CakExaFRndFVyQmpseUxpWVc0cFNQWnltWXpWNzAvb2F5?=
 =?utf-8?B?SzlaSzdaZHpNUjNVSzV0VGIxSStQNXpEdzNjMkRCdVJ4SkozR0RWVlpQa0cw?=
 =?utf-8?B?ZSt1WWRJNWlQVk1yOXpjVjV4V1V1YnQxMkhNVnhHdmI4RjlCbk8zL2xITEpW?=
 =?utf-8?B?TStrV2NuYVVRdWpZejlEYlhHVUhvU2FrNkwyV2l3Tmw0VW9ONGUrL25qaGJF?=
 =?utf-8?B?RmhBZW43Zk9UZmtMSjhtbnMyQW5rNGxwSEVsZXZrblhSOW9meEJPaGdCSXlX?=
 =?utf-8?B?N2srM2w4Ri9zS0FCTnZDWEVKdUlHTjJFcUlXVTdhenV0S3l4WGdsa3ZLeDRo?=
 =?utf-8?B?aFdZeGUrbUhSbmt0NTZMYnlEZUFrWkNadzJDRVdNNk12WVIrZEJRSnRiUkUr?=
 =?utf-8?B?bDBWV3ppYXpXYXgrV2F0Ymc4RVBmWGNtcXRzUXFKaFhmcnNxdEtud1RWa0s4?=
 =?utf-8?B?OHB6K3NXdytTazhoMTFXcTVzR29KQ0MybmlxYmVmaEtnd2lwOVZPREtQSVhJ?=
 =?utf-8?B?V2lSanlFVVcxWGdiS09TNGllQXNsa3ZKSEZ5Zk85bTNXMTVnTytPZ2g0VUVR?=
 =?utf-8?B?Uk9IRWZFaTE2VXUvTzlMbkRyQWp1N0xRYWpSMVJ1eit3UzZDTUZRV2c0MHFv?=
 =?utf-8?B?Y3VpZEFRc3h4K3JXa0laMnIwQVZlWUNsSVlCb3RseGVyditxemlUdUxISGZQ?=
 =?utf-8?B?VTMyNE1EM0lrbG5YYm8zM29DUGN4dEs3c0ZYZHJ2Z2IxN3lZK2tYKzFOT2M4?=
 =?utf-8?B?ZkJlOWlrQm1wTlhmRVhzYVdMbTZxUERzNUxVU1ZQLytBc2EyaTZDR2ZFZG5H?=
 =?utf-8?B?VmhRNVkvOXBlU3MwSExTZ2w2dnR2aFBIWFduK3dLcDU1M1E2RGJtbkpCNWl3?=
 =?utf-8?B?d3ZBb2hsbnZCWmRRZk9LTzIwcjBCbG5SU25tZXRpbUdYamNvNnRkN3A3VDN1?=
 =?utf-8?B?dXFTU1FZOXpOaVdDc3ZvZHI4WEdmS3JROCtBSkM3VTREWjJ2L0lLbkNpeUtF?=
 =?utf-8?B?ZVlqdkJ5R09EL2NkWElmQ1hReVhMZVNMelRIWGYvSlhlVThpREI2UW9FR255?=
 =?utf-8?B?d3hUNG8xMUxEOW1NYXFqYnZjYVd3L01vWGpGUk9tUnRlUGs2b1ozRDlxV1pq?=
 =?utf-8?B?eUwzdUkzYklBYnIwSEJGcVYxVitNRi9IVllCa2JGRXlxTjhqTDJ4YktNVGxM?=
 =?utf-8?B?QUVnS0hobmllTnRiOExhNWE1UGphZUtuVXVrOElWcHM2NjhkeU9NaFVWc0NU?=
 =?utf-8?B?K2E3bTZVS3hmMjY3TXQxTGp5dHFnNkxPemNoKy9PWDVLT3hnRk51cnduNTBH?=
 =?utf-8?B?Y01ZaWZEYWRKaEtRZVVFMFdkVXAreFh1WjFoaHIvbllROWd4UTU0ajFOakpS?=
 =?utf-8?B?QzJjZUtYQXBXazJDem1XcnNQN0RLZ05LVXpKYTNQajVBUExwMW5mQjdQYlBV?=
 =?utf-8?B?c2VKZldmQmthRmY4WkRlMG03Y3VJNk5BWkJGWGNrU3hJOUhaMmthR3hGRzBV?=
 =?utf-8?B?QjZkbGFYbVVsQktpbWlLcUlUNTRCMUxmTi9PbnBvRHNFaUZwaU8zNDdzbWNF?=
 =?utf-8?B?RXdhNk5GWmpkNmIrSmJodDRPc2piQkM3Y1ZveWkzbm0rRnFPenRRT01NQXNF?=
 =?utf-8?B?Y1Jyd2lxMXRDQmROQTFuL3NrMDE0S1VGYkVMQ2MrNGpkUUtNQjlvdHJmVDdx?=
 =?utf-8?B?dFdvRkF1T1doOHJ2L3RROFlsRVo4MVFYSVEvSWlmOTNFYWtaQVJuYkVpaDRO?=
 =?utf-8?B?WUJmdUMvYnRmTHpqZjdWTVlRcFR1RjhnNit4aDNaN0ZuN1RyR2tSZU9FNXps?=
 =?utf-8?Q?z7O77v4aKlOYYxYSf2U1z26YX7IYk4iFmlWAA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z3d6TXYvanR1Y1BWN2hrM1BXeVdHNnhPOTB3NSsweHo5dEdHRDFJKzRTSzQ2?=
 =?utf-8?B?ZlArdGY2c1duemFyVEtrUnNzZ0d1Zm1rMUFtNDNvZC8rTFNLaXB6Q2ZEWmRq?=
 =?utf-8?B?ekpkZ3E3NEliU3VlQjdCeWlhQ2RqRDREVGlUKyt2RGorcmdkRTRlZU1iTDBO?=
 =?utf-8?B?aTZnbjI3Qkpya21NMU1vdWQ0anZGRUYrU0w3VzMwQWFsa0dtR3hqU1FJa0ZW?=
 =?utf-8?B?ZkxjL3pCUmJqVm1wQVNOVXZ3U2VFRlphSXVBaUtYRk1FQWJYcHFEeWJRdXZq?=
 =?utf-8?B?QlAxaGtrK3pMREZrR0lPUmxFYjZqUi9QSnhKSWRHTnJNaVEzenJBcjVacmRI?=
 =?utf-8?B?KzdOd2hUc3kzbnBPd2NJd0gvdFlEQklPRS91d3lKUG9sN3RNSEhUVDhZSGVN?=
 =?utf-8?B?cHpCRjZHTTdLNENiUjBEdk5wVzZnc2RteThRRnQ1TERsSnc1bEoxdUxWaHVX?=
 =?utf-8?B?YXZmMWlTNll0dGE1dW03b0l4a2RYbE93Z1R4M2xoTkJaZ3V1Rzk5RDBRMkcv?=
 =?utf-8?B?R3pRVUZkbWxuOVZUOHRqUTV6MDNsZllOV0FFenhvVElrUFNyT3JwQW43MGNT?=
 =?utf-8?B?VlRHMEY3Q3QzVU5Sa0hZZXJ5akNwekVyeTMzVy9DQ2tLUVlvZ0dpaCtiSE1V?=
 =?utf-8?B?SHhLV0xYWUtPR3gvZHRRbjVIT0t5MnRhYmE2UVNKWTNTWTk0YzdsaVJHNU5l?=
 =?utf-8?B?b1BuYXlsVHVVaUNyWHBLc2EvMzdVSXBQaDAyY2ZPdmJIQ3B3amxIamUrMnU2?=
 =?utf-8?B?WUJsdTl1bmIzckF2RitmaEVQSExCNEZaU1loNG9jM1p6UW9nRTZOVkJ3VGhZ?=
 =?utf-8?B?TkVlMk1GRXdOWjdsWnBzenVuLzRGaHY3TzU3a3NUNFlhTFJCZW5GVWVZYkp1?=
 =?utf-8?B?V3pjRUFMVWMrWEs4R1pmZzVPTHFlT2FtZnZ6TngvNWU2QXNFQVdlZ1djM0hX?=
 =?utf-8?B?aDZybmN4K0RCOHlmQVhuUW9PcEhabTQ4NFdkWmxwVDFoSlhzMlVIQjRHUE5O?=
 =?utf-8?B?OWtlay9vYXFmQ0lWL0NRYnBEWjJFTmtiTlJXMTZLdkN5L3psTXV1Sis4WVVZ?=
 =?utf-8?B?UzZ1NGMwNXVlWWhzOGhsSlZXb1pJM3d6THA1QkpIMWFQQmhDNkJTczY5YlpB?=
 =?utf-8?B?US9JZ3BUMFQwVjl5czVzZ3Q2S255cmxuUzgzckVHR1FkTVVwMFBnNjM1UVRp?=
 =?utf-8?B?cG5kUURabTJUZzJkWXh2eUVqZUliREIzbFEyV3FDcXRpV24xZ3V1bnRWUTAy?=
 =?utf-8?B?amViWk5WM05LalZOd2FoSGhmR2htem9XdDM4VHAvNFplNmVXN21uT1RVeDRQ?=
 =?utf-8?B?ekJPT25XMEs1eElRQUhzVjN4L2lHSi9lQmUrR3hVMlNrQ0NRV3lEdkJQL1kr?=
 =?utf-8?B?dUo1MGRRNDFGRU1KNVN3RXJNUEJNZU13UjlSZTlYbk9pVFRRdldReEkzMHlv?=
 =?utf-8?B?MWliRUY5R2VmY3hUN2lpT2Z5RWU1dkxES2REelpGbHQvOWZFVUJQVEVPZWRU?=
 =?utf-8?B?Y3lqL2lURElKL2RjZEwxb2RCSWhkaDY0anZYdWpUZXUyVmdGTVE2bzNFSmZU?=
 =?utf-8?B?OEpMVmErS3BoZngzakNkejhpUVZvbGRjaUpQRUVnWUlSTW1IeUZrVHpqS2FK?=
 =?utf-8?B?czlFQ0dvSHIzUTV5Y2krcjl6dVBKQUFPTVhEQ3U5TVdDSjZId1RpSG1xdll5?=
 =?utf-8?B?b2JKM01IQ2JvY21oMGdFUlVubHMrck9QVnhnbXd1OUl1WVRybXRTMFRyK0ho?=
 =?utf-8?B?ak0rWWk4ejZSUVdIWGxaQjcwYWpvZHBLbVRjL0QzVllWYVJuV24wMHFGc09t?=
 =?utf-8?B?aWNvTnVwajUwMm5ENFh6eWVpTjl1V3U4Z1QyWmFuaTVTMUZlUDV0UUFyQlND?=
 =?utf-8?B?VkVZWm5Xd3ZGTEt2c1AxK1ArYjc4TFRxdm56ZE9sZHE3L2FpNmZGeEs0cUhS?=
 =?utf-8?B?SFZGL3hHOWxNb3hRM3AzQUdQd2tGaFJsT2VxK0dIaXBzM1R5NFRtWk9VRFF1?=
 =?utf-8?B?SVBZZVRjYnd3RURhM0lFeGhQeHFZMVZkc25ZUW5QUFNyNnJ2UmR2b2c1RkFn?=
 =?utf-8?B?aFMrd2xPNEFuT1piMW0va3ZES0NZTEVOclRRY3FEKzh2bGRicUIvOFlGZFhx?=
 =?utf-8?B?NUJRTkFpMklTZVU3OGFzYUh2WEw0Q2xncWVmb0ZweDZUNUNFU0poM1k2bGx0?=
 =?utf-8?B?NXc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: bc794efb-2faa-4dc9-9721-08dda2b4771a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 15:36:53.4274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oIpyt7G2PkWx2x3nZHBtTOl2ifWM3VU0SwjkUdGEAmFi1ykngtoc0ngoZIo6AbomoJbmWjInte74h3ArunlCECkJlrnooUKEum2nLzTQlVk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8581
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 03 Jun 2025 15:36:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6990

Hi Robert,

On 6/3/25 1:08 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> I note at least a couple places in the BB manual that refer to
> searching for class files only in the "classes" subdirectory, but no
> mention about the "classes-global" and "classes-recipe" directories --
> should those also be mentioned in the BB manual?
> 

I'm not too surprised, the BitBake documentation is typically not 
receiving the same level of interest compared to YP :) (also I'm not 
entirely sure people are aware it exists as I would imagine most people 
are familiar with docs.yoctoproject.org but not 
docs.yoctoproject.org/bitbake for example?

That seems like a reasonable change to make in any case, so patches 
welcome :)

Cheers,
Quentin

