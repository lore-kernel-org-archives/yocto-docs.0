Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ABC6D2C545
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 12:18:05 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.63])
 by mx.groups.io with SMTP id smtpd.web11.16813.1729599483297807483
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Oct 2024 05:18:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Fa6wO1Jk;
 spf=pass (domain: cherry.de, ip: 40.107.103.63, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bb7YC7+ZCCR6T/01kGX3siKlme/nr0gw1rGKaHW3I8RmLha745YBxVv5csPOKx2G00f5sCahg02HD8K0i7jAAch0nEOAmmNhYy8/z8kOdeb26XCD+vONG+3ndvJxObcP8Ga+Wx9aqygfAtn1ICfbjt6sK0XiW/lkwedTcutKgVwjNbEIUsLGwj7c0DDYuKUBc5I6qwA9+n/xiQI1HTwEonfqhOd9nN4rLUme89OB9ta8DKgVwAhqzRPuUvqlClVmbsS7wwhN+WJobx1jt1ncf7SUrSbRM5a8EbmOc2Lx8VL6s9EVvFcTUK9E//dMiw7Q7cL3Mj2gnealsQmlfENFew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=98SH9xbN8VbTJu49+dI15bH1SPQGlom85q2ISZgKwNY=;
 b=YaHYXUcD7TyLu/K3HN3klADClij/zJic5/00CrZJ4GEnl91KnF9cvdnNHegjaS4NVum/nVgN+1YBVPB9Zd3Zj2a7rlglMvSrQtEvRNU+ky6I/9B2pLKWQuRSYZnaRyHanxEKhD9Q0TdPY8Fs4eDQLavQ909qAKuS8fSwcWJTbaBX3EYK9knyrN6ATpLKpxB9b9SyFNHICISnplxguguts0OWwOKBtETvEezUs0j4w5OI6tLuSqAMzmWmEGDgSC/1LQ+QarfAWKRTFITwhVBXBySK9c5l/13ArzVoaUllMsjO2wXF7JWK+3uNGnPDGvJKLjYcPam8fZsjy9nt6E60fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98SH9xbN8VbTJu49+dI15bH1SPQGlom85q2ISZgKwNY=;
 b=Fa6wO1JkE9ieDkgvrA8jbo74+/Iwgiy9wFwYnopWt2BhQUI0rznzF6VhW2dGJ+yaP0UrZmePDiPaTFcF8bM+ITLkYPPmSZ+pelLLW6d1aFwFqM0a7xUAJlzlodaWIZxCG4cMgNkL6x/QbpGWUT+1gu0wor4Or/4MoPWUT9Qqghc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by PA4PR04MB7696.eurprd04.prod.outlook.com (2603:10a6:102:f1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 12:17:56 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%5]) with mapi id 15.20.8069.020; Tue, 22 Oct 2024
 12:17:56 +0000
Message-ID: <fdc83afc-d274-4a90-8fbe-ef0717f099af@cherry.de>
Date: Tue, 22 Oct 2024 14:17:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] dev-manual/debugging: improve gdbserver debugfs
 docs
To: Antonin Godard <antonin.godard@bootlin.com>, chris.laplante@agilent.com,
 docs@lists.yoctoproject.org
References: <20241021152254.1745411-1-chris.laplante@agilent.com>
 <79f143c4-7d78-4090-88bb-2b0e5ec4c404@cherry.de>
 <D52BOKSQ5RMM.31B7I4X4AJMN3@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D52BOKSQ5RMM.31B7I4X4AJMN3@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::10) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|PA4PR04MB7696:EE_
X-MS-Office365-Filtering-Correlation-Id: 2942b067-71de-4c96-1d06-08dcf2938f93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WDJHWjRSRG8xT3Z5TkNEVmRwY25hcHJPbzBiMWhndit1Tjd3eHp1eU8rTVN5?=
 =?utf-8?B?WmVJNWpGeE9SNk5QY0ZQckFnSnJPbVBYOVZnNXhyRkZWN0pYbE5CMlJTaDc0?=
 =?utf-8?B?dkxYNFE1V0QxR3V2L3BqZkEraStnLzIzdDhaZTdWODZGVEI5UWljMEp5b1hq?=
 =?utf-8?B?S2xTU0VoQlhMbGxXOTBSRGE1NFY4dzFHRjBNV3BOcFVsZk9qUE1hYUx3dWhL?=
 =?utf-8?B?dER4V0ZxaWE1bEMxQmRlYVg0NEVwNWp5b3lnNGlUbCtGWnltRzFLanRwWTUx?=
 =?utf-8?B?NEZsWGNVZ1hnRmpPc1IrRGRTWmYxSnI4S0ZFVnhLci9hV1o0Q1BwWFRYV29o?=
 =?utf-8?B?VE9NQ1FUdEtqMHVUcXVtRDZQVWhKV2dOY1BNcFV5SmJNSHdBeGF6NitFNUJv?=
 =?utf-8?B?blk5OXZCb1htSVNZT3FZT3VKVEhRaTZ6MFoxcDhoR3AxSE5NKzVoU0RKcjlW?=
 =?utf-8?B?WVBocGdXOWJ6UEJvRWVCRlY5SmRlSjF6Yml4L1RUUWhieHhlcm52L2lvYWty?=
 =?utf-8?B?UkdSVkJWejhDcVBpT1F2SWJBcUd4T3N4U2dzQkhrVEhUK0hDTWc2aXp4U2Rh?=
 =?utf-8?B?SlFybFkwbFZrREVqM0VLbG4ybEFDSEhaY2grQTZrVGU5b3VjOHRTTTZjQjJa?=
 =?utf-8?B?TWI2Vyt6d0pBVExTY2UyWS80ekl5cjYvVTlyaHJMWEtkSnhFVm16dXk3M2di?=
 =?utf-8?B?WHU4UFE4Y2tsUmdnUERnRHc3QUhDWGNSV0UrbUhuQWR3MVAyK29kNlNuU0c5?=
 =?utf-8?B?VEhWTVIzbkM5cnFaT2l2azRGTURuTlNRNlNHelBsZmVaMUZjN1VseDdmU0h4?=
 =?utf-8?B?YmVETlM2cFdHU054YjBCbkg2QkVhbnl2bSsrNFp5c1R1S04wU3g2eVcwRk9E?=
 =?utf-8?B?UldJTWhvZmdhRkk2aTIvcEJIMmowWTlTc0hDTVdqQnZZaWM4M1Z2MU16dlly?=
 =?utf-8?B?U2VNdDNJeFRHdUhzUnUraGhDR2RlZ3VWc0h4TmpRQlY5T0tNTklvaGMzYjJM?=
 =?utf-8?B?UFFOeHMzMllVcDFRQTJ0aFJ5blNsMG5TNmYxZ2Z6eWs3MGxKNnRVRkhrVGhL?=
 =?utf-8?B?TjJXREVXTDZ3N2RpNnh5V2gxMFh4QWhDTTBnSWVUQ3dkMkVKNllkNzR3OHB2?=
 =?utf-8?B?OEgxMlhHeFhVSlNBbEpySjZUVi9aamRNUFhiUHNwbGR4aUNNUnFBVVhHdnFJ?=
 =?utf-8?B?L2NlL2VYVDZFelRWNEVwemJEYWZHWUZwcCtFbjZXaUVId0JiaFhoM3g0RnND?=
 =?utf-8?B?eEV4d3ZocE4zOTNORlhwN0ROSE41ZXQwMWFYNVduUGQyMW5uN1VLN3VFNEhY?=
 =?utf-8?B?anp6dHR0UG1GdTdLc1NiT0Y5ZVpZQnpnL2Ira0pPREFnOVNHaENTUUZKSnZI?=
 =?utf-8?B?aTJPQlkwZm85b2RnT2c4QUVONkFqQU1ENWR3QUFDbWxobGZ4czVhOGYreDRL?=
 =?utf-8?B?QVEzek5sVnJDNXd4UnQ4K0lNYUxzTmhrTXJPaHUwOEFoQ0hZZmplVEoweXNl?=
 =?utf-8?B?bEthVEVIaFlCejJ5VEV1ZUdPLzU3MHlHWlk3cXljNVhoeVA1Z2F2a2FQMEtu?=
 =?utf-8?B?Q1pFaUZRcTkwSEU4UkpsMHB4Z2ZNVStVSlAzVW15YlBNcXJKWCsyMTBsb0Rq?=
 =?utf-8?B?QnZId01laVR6RTNBR0N1Wm04UjV4WW9rSExzMVlNZEpCb2paMnFDNnQyRWJi?=
 =?utf-8?B?bzR3TXNyUVUxUUpPYlR4OHd3ZUlGU0ZjMVVUV0NPQURHMVVlNWhQN0IycW92?=
 =?utf-8?Q?sIp016mChmwLN8qh1DBFy9rBz2vZLzB7Qg/q4vs?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Rlo2QnFZOHdrRys2bm91cWxHamVJSmNBZGgxY1l0QWJMNU5DVHZkQnRUcGdT?=
 =?utf-8?B?dEdPUjRVWldmZVlKMDNtTDBMNzVPWWFqUHVXNVIxMW9oOUdvMlllVU50b1NV?=
 =?utf-8?B?Y0NmbHk0OGZJcjhZRGZDMnBhNVFOaFVaTnM0dFpON0NWblIzQTEvZkFvdlBI?=
 =?utf-8?B?d3JxdVFRVUxoQTZBOXV1V0pWVWZBeW9DZ3dVTE8vbEQzNzQvSkJsN2tlRjAz?=
 =?utf-8?B?dXU1VlllblR5MlE3N01UbXk1ZXEwRG9hbHdZQXlnYjNpVVZaMjFqRVIrOUJ3?=
 =?utf-8?B?ZWhiSGNuWGJVc29XUnBDaG1ZWTl0K2pqRXFNU0hEbXlTM29Ta0pKMjNkY21x?=
 =?utf-8?B?cEdJcWVtUVpTTUM0OU9XT3hDY2syRzl0TUpzNmhaOUZWbFlxZVgxK3FVQlJK?=
 =?utf-8?B?VkhrUVhLak52bVFEKzJHQ3VPRFR3Q1hLajhJS3dBL2IwbytuVVF5Y05JcWhu?=
 =?utf-8?B?NHYxZkR2VHJXK2FmUjRtUk1reHZYaHJoSE1uQmE0OU8vL3hHKzluYTVyZXM0?=
 =?utf-8?B?cVNQZWZBdng5NXAzT2dJOWNIaldXN3FrcmdVb1AzTXVYRHRzMnRJYXR4V3BU?=
 =?utf-8?B?SGJBSklIbWJoVm84T2NaUW0xV2UxazFYbUU4bzlseUdlc2RpcitOR2h6aUlY?=
 =?utf-8?B?WmEzVnRNcDdkeWtWN280cENCKzRFNVR0aGh1VUY4N1Q4Ym1hcmFXMDNJN1h2?=
 =?utf-8?B?a09vc3RWU0RxYmJPV25sOGwvU2tuVkl2T0ZRNkZrbWNwUi9vWWdKOHdlRyta?=
 =?utf-8?B?ekVNSzBZTnRINXUxMkVJNkJ6VFFuOHZ6ODAzcUw3VlpxSkUyT1ZaeVkzRnVC?=
 =?utf-8?B?UURGSWdhNlZzSThkR1o2UDVYdnU2RCtkd3U5VXp0ZUNMY0NWOVBEbmVnckVq?=
 =?utf-8?B?N3IwTG5SK1AwdHZXYUN6R2VHdEtrMWVkWTdobVd5Q1ZvSis1ZytqNUZZOTAx?=
 =?utf-8?B?c25xbnQxT01sZkpMQmtPUXlnaENTM0Vaa3lrRVRTeEZ5U1BvVm9hWmM3NXJ1?=
 =?utf-8?B?amJubkJFZ1E2UDBidy8vODBsVGlyWkFHY0laMVpNZjFHTVUvbDk5clErNHQ3?=
 =?utf-8?B?R0xndlRKRmYyT2hlWW9yY01OM0hLQmltSXcwT1IwZVdhOWsxV3FtYjJIMUlj?=
 =?utf-8?B?YjRpYVpuYWpRTVFSR3lJc01BOTZwZXNSZkI2KzJLYTRkejVRalNhRmVoUEFl?=
 =?utf-8?B?clk1VnVCK1FvVGlqV0hHc3c2Zzc4eHpXc0pqNHpVcVU0SHNaejNQU2IrN0h6?=
 =?utf-8?B?cWQ4SDRUY2xqRklLbEpLc004aFBPQ0dEeitPSXNHaDZzbTF6NGY3SUdHdG9w?=
 =?utf-8?B?OWQ1RjNuZXRPdUNLVCtUMk81aDQ0SlhpYTR5RE91dHhpU05JZUIwejQrZU8z?=
 =?utf-8?B?U0s0Y1V6b2tKQmIvbDZFVURBdVRsWkcyVEV5RjZqUFllTTA5emV3dEF6VXc5?=
 =?utf-8?B?a0t3M2NDTEFoQXRZY0FaRTJFRldvRDdtenVXc0MzRWptWVZoS1FWckdxUThu?=
 =?utf-8?B?Nm1mL1NWTDRzeFZuMTZDM3FGUnRKdjlLWXF1SmhjVE1NN0piSEpWdVVTSkJw?=
 =?utf-8?B?L25WMGx4ZENTdEZYQjFmRi9VUVFEZHVtL0VOd2JjdjQ3b1Bta1NIb2tpOUs4?=
 =?utf-8?B?Y3pKU0VLR1c5SnRPNThkQUQ5ZnZZNC85OUhUamxvSmFrcnpEV2Z1UHpkblJU?=
 =?utf-8?B?QnczRVhFM0tIbnZCTTJ2TThLaHpvbHhFenVFTjJFTUxOMytkeFl6QVBTVHI4?=
 =?utf-8?B?bS9EQVJTM2kxL0pINlVlQW0vUVJpV2ErMjhzMkROc0pRNHY0blNWS0NRK0Ny?=
 =?utf-8?B?V1Q3SG9pUmsxQjBFKzlCVUZ4Z0VnK1QySGtidGtWNGorSUpMbzlqOWFaa0lR?=
 =?utf-8?B?NTBza09TUXZzUWpQR1g2YjJNaWpyY01tckJTVlFJRFQrdkNCbXI4RDRsODJ0?=
 =?utf-8?B?VFJZS2xOOFlieDVoSDMzcjNJTmJXempKU2ZRbDJEbzFXRnBvRFl3bnpyQXRL?=
 =?utf-8?B?QUVxM05SSHpCanB3V2hpaGpaUlc0R1VKWHpJUFFHaDVZcldVRE55Tngrd1pY?=
 =?utf-8?B?WVl4ME1uSXBDb2NoVXBHQTZWc05mUk1RKzNoWUo3ZjBCZGVHM2txenhlNG5L?=
 =?utf-8?B?VUxKVHVtRUhkZ1g0K1dtMk1yRmZXdnhoa0VNS0JqeXhObzJla1VmREg0RExW?=
 =?utf-8?B?c2c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2942b067-71de-4c96-1d06-08dcf2938f93
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 12:17:56.3507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hl6PPtVdFUjLZL4CcEmmHexior87dIjBaVnuHCyBjPM6sBOjT/QFAaJgNt6SdABRHN5De0qz3PEEfc5aqwvUhAjJDUX4DKk/GsbnruOs+4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7696
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Oct 2024 12:18:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5560

Hi Antonin,

On 10/22/24 2:10 PM, Antonin Godard wrote:
> Hi Quentin,
> 
> On Tue Oct 22, 2024 at 1:57 PM CEST, Quentin Schulz via lists.yoctoproject.org wrote:
>>> 1. Make it clear that IMAGE_FSTYPES has to contain tar.bz2
>>
>> Yes, but isn't it done automatically if IMAGE_FSTYPES_DEBUGFS and
>> IMAGE_GEN_DEBUGFS are set?
>>
>> We have a selftest here: meta/lib/oeqa/selftest/cases/gdbserver.py that
>> doesn't seem to be adding tar.bz2 to IMAGE_FSTYPES, so I assume it's fine?
> 
> I think it might be because qemu.inc adds it by default (not a oeqa expert
> though :) ). Here's what I have by default with qemu:
> 
> ```
> $ bitbake-getvar IMAGE_FSTYPES -r core-image-minimal
> #
> # $IMAGE_FSTYPES [3 operations]
> #   append /build/../work/openembedded-core/meta/conf/machine/include/qemu.inc:18
> #     "tar.bz2 ext4"
> #   set /build/../work/openembedded-core/meta/conf/documentation.conf:215
> #     [doc] "Formats of root filesystem images that you want to have created."
> #   set? /build/../work/openembedded-core/meta/conf/bitbake.conf:844
> #     "tar.gz"
> # pre-expansion value:
> #   " tar.bz2 ext4"
> IMAGE_FSTYPES=" tar.bz2 ext4"
> ```
> 
>> meta/classes-recipe/image.bbclass and
>> meta/classes-recipe/image_types.bbclass are the only places where
>> IMAGE_FSTYPES_DEBUGFS is actually used, and it seems that we're adding
>> the content of IMAGE_FSTYPES_DEBUGFS to those of IMAGE_FSTYPES if I am
>> not misreading it?
> 
> In image_types, the following:
> 
>    fstypes |= set((d.getVar('IMAGE_FSTYPES_DEBUGFS') or "").split())
> 
> Is an union, so if tar.bz2 is not in IMAGE_FSTYPES it won't work actually.
> 

It's a union, yes, but that's why it'll work :)

 >>> a = set([1, 2, 3])
 >>> b = set([3, 4, 5])
 >>> a | b
{1, 2, 3, 4, 5}
 >>> c = set([5, 6, 7])
 >>> c |= a
 >>> c
{1, 2, 3, 5, 6, 7}

c.f. https://docs.python.org/3/library/stdtypes.html#frozenset.union

> About the other IMAGE_FSTYPES_DEBUGFS references, it does look like it should
> add IMAGE_FSTYPES_DEBUGFS to IMAGE_FSTYPES, but it didn't when I tested it, so
> I'm not entirely sure :/ Maybe this is a problem in oecore?
> 

That's basically what i'm trying to figure out. Should this really be 
documented or is it rather a bug that we should fix (and could document 
for older releases)?

Cheers,
Quentin

