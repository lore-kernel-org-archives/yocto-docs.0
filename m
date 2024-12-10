Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96F1FE7717F
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 10:29:18 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.56])
 by mx.groups.io with SMTP id smtpd.web11.7201.1733826549716792534
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Dec 2024 02:29:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=aAevgYy7;
 spf=pass (domain: cherry.de, ip: 40.107.241.56, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nVYm6tSnoEFXr0OMOPn6Vvq6pXQ6TBt1OSM+ZaUhjFn1E/uP0rQ9Q0ylohtWc0LUW+qIBLXImL9uBx7BCIOLcMZMZ5S2Vuw87ZeGJL+koUuG2XaSs9xccSZqFiQ/v1kQJ2CvcznKnVjxRSw+Kj4MHSr2S72Q8FIFldkm9ZcsQcmGtmhEKkRawNv+jOWpTFfDpDjeX4cEBdzJFTZIgs7Int4mLO5ZBwCqfZrZ5glHwnnqhmQugOcF+c5yd0Ll9VezzrOXnGjcidZJZUZcW+jQS6ZcaGEvlOlZddxcyZW1tRfIRv9pE9gqsw4wjyFWdm0/DeFy6JXEM0kofPAuq9NOIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTJA6lXb3QaTOoaM8+Qa119urV3o91vreP3dmhecge8=;
 b=fU71yB9nTu2yawrn+Wo0GBVNu3tW+C+GLpJg7+lJNUGFe639zCmW31ZjR7lIU/Z3ia4YjAvM7lZlrXGA9HZ8/KtlqI5cpokH6Hw2Hbvev3aC0k7SITVU/AKZTq0qVHBtbVER2nhC/9qCVZSLcEoxJyBEfZn6+7O/bTNK8UdTrdxKYxnScL/RXjXyqmMxFsxuOFsdCZME1DMdkPS8s0fHklfQ9kEMfmMFNYqZTwIyblz0uEaWnCyDuViRWADpVUvuzzKBle/exPrSyYkyrm2mstU46AnKc+uTZtnpJuHKBjWjQ6otYOQxGfPMPrYE6CpTcCOAFlJioHHmOSfQzF3pjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LTJA6lXb3QaTOoaM8+Qa119urV3o91vreP3dmhecge8=;
 b=aAevgYy7sCJnZvoGobVR+cQ2Tgv2d+q8XrXyHmxE7xRrPkuU4c0vsjWDrb6sS3cc0o22H2vEnEVuAMlQLUqoh9IV+PEaeeCim0FnlEVCoi24hFcjf3M6OjEgYGajEyXVQs9d5pmpEiwhsPjSPfgzOW0hXjZ6f/QkHEyCwjrD4iI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU2PR04MB9147.eurprd04.prod.outlook.com (2603:10a6:10:2f6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Tue, 10 Dec
 2024 10:29:05 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 10:29:05 +0000
Message-ID: <3a2bb5a7-b384-4b92-8548-2e53cdd279eb@cherry.de>
Date: Tue, 10 Dec 2024 11:29:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [yocto-docs PATCH v2 1/6] Gather dependencies in poky.yaml.in
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241204-update-doc-deps-v2-0-1d9b4063476f@bootlin.com>
 <20241204-update-doc-deps-v2-1-1d9b4063476f@bootlin.com>
 <bbe9f42c-e716-44d7-8930-71a44c4c9a36@cherry.de>
 <D67XK5T2S8K8.372YF65W5YCAH@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D67XK5T2S8K8.372YF65W5YCAH@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU2PR04MB9147:EE_
X-MS-Office365-Filtering-Correlation-Id: 11a9a1db-d3f8-40f9-dbe6-08dd190578cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RWhNdm5QdmEvYWNISE9aYlRrRGJWeis0K3NYTTcxaGxrMDBxUEZNVlkyUElh?=
 =?utf-8?B?ek5tWllNbGprMzZyRmh2emRXQjd4amxXNFhLSlljWERabDcybGxvQUduMkJW?=
 =?utf-8?B?V20rWDhDZ3NYM0VpR2JibnNFbjE4UEdqREM1ZDlBa0sydENJU1Y4U2llZktm?=
 =?utf-8?B?ZkZLV25oSldqaFl2eWRWK2RLcUh3cDNTQ05ib2p1WmVwc2F2TURnZ01wbFk5?=
 =?utf-8?B?ckY2YW1jR1pocyt0b2NucmF5U1NCYldrQTVaMVAzUjRIUERtSGpsWXFpZ1ZU?=
 =?utf-8?B?KzhvWlNKdGtWaUhkaUdXcjJVY1VlY2xpOTZBT1g5Ylo0ZnowZ0dYU1ZqU21z?=
 =?utf-8?B?MU8zdXdxLzhTQkxPeGpWeHVQYmttbUt4dTluZGZGS3ljWUVkZGdldTFsOE5K?=
 =?utf-8?B?ZXRaQUNXNnpGVWcrYitjQklpOWNnSitxS21mdlZ1b0grODFHcjVGSUNqSDJi?=
 =?utf-8?B?ZHQ5N1lubWRRSC81WmZwTktLYUVHY1JRWG1xTDVFa0RGSFE2dDF1NE9URWVo?=
 =?utf-8?B?WWRUdVdSbVh1cEVqaE56U3BWMEpKaW9hUFo2NTFJVGtJYy8zRjVidDNpczRi?=
 =?utf-8?B?N1l1V1RaVjAvT0ljMWVRaGFKWHM4Z29rampmSTB1ZFhvUGFzKzNJMmFXY1p0?=
 =?utf-8?B?SFVJYWZsZEpqWC8wSjF5Ui9mVDFqUXlLODJHVVVJSzJCbmVzYXJ5QVFydGdr?=
 =?utf-8?B?Sk9Rb2ZLMEhiSUF6L21hdnJCVGdsUUYyd2lGbndTRmllb3haR1JvUEZVV2Qz?=
 =?utf-8?B?azdGSWtIT3oycGVQekM0VUE5Z3drMWVSUnJWUVlRQTdFWm9Yb1lIWEZNdjFM?=
 =?utf-8?B?K3FwUzBSNkNxZWo4OTRtS25lNDgwM0xFNHZhdmcwaXU3YlI4RDlIOWEyVHJa?=
 =?utf-8?B?ZnpnSWxrdTkxMEhiYlBhSkJ5UjJvMUhiOERHY3BtaHhwa0cwTThxQ3h2OGd2?=
 =?utf-8?B?YS9uVW03RG1uVEJKYk1sTTRBdDByNSs0VDgwQ09KekprQzFJVE1Cd2l6bWti?=
 =?utf-8?B?ZTR4Nkh1U3FXVG5OSmo4b084d3FGWEtjc2FVdGEvZHYyQlJta2xlSzY0WjJU?=
 =?utf-8?B?MW03aDE0blkxdlVIMXo2UHZnRmR4NFp5TGJlZjNzOUVqYVBJR2VCTkViWkt1?=
 =?utf-8?B?NHlucDRoUTNLVHV3V0liT2QwbkM1S2pjcG8yeXUrQ3ZSazVKUVFIWGhFVFln?=
 =?utf-8?B?aU5nVnRpTjZSMmZrMm1yZkNPRXkyRTc4OERxTkFxVkM1cUxlQ3Q4MGlxRnVH?=
 =?utf-8?B?enFjbUJvNUN2K1FESnFnOUtjQ3A3ZGNNeW1BSi83U0FtSi9WaVdHZ2hucmZx?=
 =?utf-8?B?QStBdUhvMWxqOHhGYWFkZi95V0gzSXp1QkZ1RDkyL3FNU3ZHMXFVWDBEc3Nh?=
 =?utf-8?B?dmZTREpyaVEyaHFCZ0Rlc2kycTlRWlJFQ2VMUHVhWkVXVGJMNzJYOWI5c3Ba?=
 =?utf-8?B?djcrc1R2WnYyVjJuVWl6VkgwdFBMM1R0Nnl0Ukcvb0VUOWpXMmpUcXZkdStC?=
 =?utf-8?B?c2ZydjhCTGh1bzdHNk40Znp3a0l3NWZmTXNBY3RxVS80TnJ1cGs4LzVma0dt?=
 =?utf-8?B?N3VEUWhyaExMSG1IS2FObExHaEcxbEtKUCtTd2dlVjFEdm5QOUIrZlZPZG13?=
 =?utf-8?B?VEQwMFY0SjFlOTBZU094dmdOaEkvYVJTTXNlOUtLeUpYN2Y1eGZDaDl6NHk4?=
 =?utf-8?B?U0QvKzFnTkhOTnpiN3ZLY3JzSXpPZUxhRHJuWDlYcS9SaHdycEhkVnl0TFk3?=
 =?utf-8?B?QjAveVJobVRnY1hXU3BmRW1HeVlUYjhGamlFTzAwU0Y1Wno4amJjZVlyazRW?=
 =?utf-8?B?bytiSitQSFZxSzJJWklCdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZVBqSzhkOXYxeU9YM014N1lQM1E2blBOR2RoN2dSZVVNSXpkWHhMODJKMnRH?=
 =?utf-8?B?WkFDb3hEMTEweHZscFU3YS9pMm5OZU51UGlXelRDSjljaGRSN0JWSXU3MFlw?=
 =?utf-8?B?TndHa3gwcnRPMGVHdlNhSHRXbksxRmlNODVPeWo0L2pET2phWDRMWUFSeGlh?=
 =?utf-8?B?eW1rWStDZ1d3NjE3UmpMVnNSUWdRM0N2M1NnREVEYVNnQkZrdmJuQlZpSmtt?=
 =?utf-8?B?eU51L0ZCSCtpL3dZWEl1RnJ6VlBaNEovUlZmeTBwMjJ1VmR6anN5MXRvS1dR?=
 =?utf-8?B?K2l2RnBiWnFPdCt3UGhLUkFuTHBnUlA5WEgvQWI1eWp5ZmVrcWNFbHVhM2dK?=
 =?utf-8?B?TElxV0RIaS9uNTVscXowanE2a3ZpOGdpKzlMbURGYXJ3WTVmb3dyakhMcTNS?=
 =?utf-8?B?b1ZmM3pMakZ2NDJGLzRQeFVwaktyVG9BSEtINFRqbDU4eWxlcEttanJNVjAw?=
 =?utf-8?B?bHhvQmJMYnVxMmFwSVVrRzg1RTBGc3VoYlYyeStyT1VsUTh3c1RuZnRIS3RI?=
 =?utf-8?B?bUxzTHo5REx6aW5LVkU4UHNhQTBMemw5RkJNcTllVW45V2oxMDRTQ2IxYk9V?=
 =?utf-8?B?YUZ5WDloUUlGUlJ0cUVaOFVQS0s5bzcrMWNIdkJsY0ZIUVdEempOc2tQQXZj?=
 =?utf-8?B?NHhrL0h4RnhoNjMvblBuejBiWFplQm1ORUtSckRoOVptR3laRjVSN3RZVWVa?=
 =?utf-8?B?UCtsbVpoaE1IQUptemYzRzQweW4xU2R1VGx3SzdSTkdGOS9FUENCNmczbWNh?=
 =?utf-8?B?bVBJbE1Jc3ZsY0xaM2djUy9XS0JlZjloT014MDdibVRNZHl4Wml0TVRDL3Vj?=
 =?utf-8?B?clU4bHJoczdaQkFWeVRUR3g4ODRGREUwaW9sKzkvUGp5RE93eWNNTjRIazZ5?=
 =?utf-8?B?VGp1TENhSUJ2bVVzay91ZjVkMFNDSG5DR1U4MWlYUy9hOHhwd0NWSzY5VDZv?=
 =?utf-8?B?aUVZVEpKeUdWRkZPV1BvajRGRXFFaWlzZ3JFWDhQMDI2M09uZ0lId3ZDOTYw?=
 =?utf-8?B?eGNCRHJDbktNN1ZYa0Z5WWFHYXY0NXcxUDRITGdqQXJjdGM5TDFxd0dPL0E3?=
 =?utf-8?B?M1dUSEZLb0Jwai9sSnNyMlNoUHpTbHlwSG83bFJZbXVQSldLdkFYTnJGaFdn?=
 =?utf-8?B?bWpFZDNVclFScmxOcnJmVlVvbE1FZ0VWSHBWTERTS2ZXclJBR0lQUnJKWWRQ?=
 =?utf-8?B?RHBxUzVyUlpJY005MkZ5ZTJWWTlPdmxHYmpTNnQ0emplaFlRRnoyOTh2MnR4?=
 =?utf-8?B?cSthU21obC9JejBSL1AzVUJMNGdMOXpndU9NVUFoSUdtVHJySGpwa01NajQ5?=
 =?utf-8?B?NmJsZlc4RTJmK1JockxjZlBkZjNqaDh0ZzVQdTRQOUFUbW92OUE3b0hHdmdX?=
 =?utf-8?B?RnNLclhldVFZTytqc2JGUG91WkkvOGRrQzcyMlR6V2o5RTIxSDZkTGZTamRB?=
 =?utf-8?B?VFlRM2NmcGU2bzZPbkFHSE10c3paOVoycm9nWUMxTDk1Z0hZRTFkRnA0bFFW?=
 =?utf-8?B?THZYY3p2UlRxbzIwWHhneVRkU0tSZlZONnVRQ3VvZjlRRHU0azFmdVJ3UFhT?=
 =?utf-8?B?eWVHRFAvNmI0TzZSTnZncjh1WXRzRWpHTDdMVkhWZjFUdGFhYmZ2cUJ3WEZM?=
 =?utf-8?B?YWluNyt0Y3NVZmkxQUtDd0JIQUIzZm40cGNBTmkvTUs2RE5JT21xRTVuYk5m?=
 =?utf-8?B?L0xyNDRwb3N2em8zTHA3MXVvQUJMTFdnc2ZPZWppR3VKVk91ZnBzQm1NWHdD?=
 =?utf-8?B?Skg5YjYwdjJZdWdkb3NESHFsWXVqY0VBSjhUR3IyZXgraHozMVdCWVN2YVJo?=
 =?utf-8?B?U2kyQm5SdUF4M2ZRTVBzMk9TaFVFclRiRUtPWFk1LzRHaGsyNW9udWtoNnYz?=
 =?utf-8?B?dUpqRmNtQmRicTFPNUFDZE04MmI0bFhyaUowWCtPd1FFQUFNaExLaXRyaksv?=
 =?utf-8?B?QmpXbklCQ0V4VzNQRWFIQTlUdHdhL3VpZXBxYkJwUW9aV3B0Y0VET25Vc25U?=
 =?utf-8?B?bFJNeUpNYytzUFBoSHhjd0J5TUlJZHZCVXJNYTgvZVloT1pqTHNXSW94K3Rl?=
 =?utf-8?B?ZUo5VWQzdmx1WnB3b0VPK3hkLytKVFNoS2svMnpCejcyRVk3MmRzdkx3aERx?=
 =?utf-8?B?Y0xjeG1WQ0djdFgrd1A3enk2NWsybk1PZmo4VWFXT25rSEQ1N3FxMDR4NnNs?=
 =?utf-8?B?Qnc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 11a9a1db-d3f8-40f9-dbe6-08dd190578cc
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 10:29:05.1076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E52iMQjeW5PeN95v2eX2JOx4lIpZbjrqXGOIxz+WglovDq2MGawE/He47a0lQscP/tTUEkDh0FaplbXCpuByMAaxPOFHh8+i5c2TJZzPsZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9147
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 10 Dec 2024 10:29:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5917

Hi Antonin,

On 12/10/24 10:58 AM, Antonin Godard wrote:
> Hi Quentin,
> 
> On Fri Dec 6, 2024 at 2:51 PM CET, Quentin Schulz wrote:
> [...]
>>> +ALMALINUX_HOST_PACKAGES_ESSENTIAL: >-
>>> +  bzip2
>>> +  ccache
>>
>> This is aligned with Fedora but I'm still wondering if it actually is a
>> requirement (well, if you INHERIT ccache, yes).
>>
>>> +  chrpath
>>> +  cpio
>>> +  cpp
>>> +  diffstat
>>> +  diffutils
>>> +  gawk
>>> +  gcc
>>> +  gcc-c++
>>> +  git
>>> +  glibc-devel
>>> +  glibc-langpack-en
>>> +  gzip
>>
>> The original list had "install" but it's gone here, on purpose?
> 
> I don't think it did actually. I see the "yum install" and "dnf install"
> commands but not the "install" package.
> 

Overeager mouse selection I did to extract the package names from the 
list and sort them I guess :)

Yes, doesn't seem to appear in the list today either. Sorry for the noise.

Cheers,
Quentin

