Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE1BCCFD632
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 13:41:05 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6046.1767793259801270717
 for <docs@lists.yoctoproject.org>;
 Wed, 07 Jan 2026 05:41:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=QJOD7ZIB;
 spf=pass (domain: cherry.de, ip: 52.101.84.56, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cS74WZCQGyJjRTsp1iqZOEIH1NLkePs0CuPxT66Ti/sNgYsrbQEsxSMHCi+dJeoYHAJH9s5HrdVc/O5W4xKYeh+i077C7POfO6MTGzGJUlkzdwNHKmg+FSFly1GBbCLn5TGbe6z06KsSjXqthArNCZut347oPlNv2jaFA9VG/aLi7iYJ4rLV4Vq/jj2b1m1EMUe37npEB6blNXUZ6ZabBoaEkpRrUI+e2M61fnp9/tAm0/3xraP5AEf9LO1cpesWYvbv5jK9jmExTeqUcWn25myA/+YRv1hmpnVaEiYeuWy0hI3se5cfzIlCiP6mAjWeHw2cvshm2pJRwr1jtyyasQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4WtOyPl9DlJj2aQZVz55+iyUBVv3hpM8E8waoYo2OK8=;
 b=Yo0nLrvJTeT07xpzKPcdXAHDx9ORMqxoOml50beqOqSpYoYcxJCmRkrmBGxUvIgBwwP96NQXopbhEsK6+1t6yLSKYy2r9wNWqqxsZosFrCcDVDqRtWrngi7EvyNnUggrsKistUWoDDWIGK90D4q63nvsrZ5BbDXI3iBkpM/jeIM5GC9GaG1/xlGSLs12kHL5cxzwvU9U3TqEbayAIJ49Pld2x+ug6sSShCPBW33lL4wBB+IL1Qh0ofBjytBy6Nts2hLCWc2RxyQ3W/41LBAo5lSbi7GnTyB94jaSwAvhnDwjA+4/f1NqBy0aXitaEy8fZ4jzvrF30sBY5YSAhFosKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4WtOyPl9DlJj2aQZVz55+iyUBVv3hpM8E8waoYo2OK8=;
 b=QJOD7ZIBZhByvkaesycAAjOAobUbj7GacBzRVpR0K37GCtdisXSHKm0KlRmrD1M85X5KcRzwPDFn4UNBliRinUwCuWG/hhUmJKRmO11QFv7T8B1zP8zjFWHBTxjp1DQpvEQ6xydfcpmBA8zYlGB0+x6EBngiDlix91qnYkYMKR4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PA2PR04MB10515.eurprd04.prod.outlook.com (2603:10a6:102:425::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 13:40:56 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 13:40:56 +0000
Message-ID: <54ce5cd2-5ef1-4094-b299-b218aca71567@cherry.de>
Date: Wed, 7 Jan 2026 14:40:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] is a wildcarded bbappend file name valid without a "_"?
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <0a95bb97-ef68-5bb2-c4f6-319fc8f62e06@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <0a95bb97-ef68-5bb2-c4f6-319fc8f62e06@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0238.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::17) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PA2PR04MB10515:EE_
X-MS-Office365-Filtering-Correlation-Id: beaf9395-8870-4856-b3e7-08de4df26241
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Nm1oaktuUmQ3QWZncFVvYi8vcUR0ZDNpRW9NckN1S2pVbUlBSzNLWW1UTUdI?=
 =?utf-8?B?OUVwSlFxc1c3bldhRlhJUWxXMVIzei9DRElqZnJSQm5TNTdnbCtoVFpZR1pw?=
 =?utf-8?B?bnlSSUNGT3VqWkRBM0VhVjZ2TmJYcjhvbU5ZZGtiLzhaZGd2dmRCTzhXSmZj?=
 =?utf-8?B?K3ZyT3djZTB1V2FLUmlkbjVDTnZnSE1Ib1ZSOTNSZHU4clhsaW9PbU8xVldM?=
 =?utf-8?B?S2c2YjcvejNheGNZbEQwOUlENmhDYnpzMUphY3BtaGN0YSttVzREZHZwNEJy?=
 =?utf-8?B?Q0U2NSt5ZWt5N3hTRzFpNk1HQnF5elVOZHo1VkRtNU0wa05wb3ZKSUgrcGJ4?=
 =?utf-8?B?Q3kyRVV1WXJUUTJmMi9IaHVZWVhuaUtYMnNJc1VicjY1NzFFMGFGYWI1WDV3?=
 =?utf-8?B?emtQQTlnbGxCbk11U2hIS2dJODVtVGh6WXZqV29SaEQ0Y1RJU2t2NDNnclBW?=
 =?utf-8?B?Mnl6QU5xSmx2S0lLUHhYUUpGeWM3K2QwbEVVMzNjTlBQNFF2ejFMaWZkWU5p?=
 =?utf-8?B?TTE0NU1zUzZJUXc0M21pOGlZcGlxUTd4bnU4YndJVE02QkE4aXJMUGpOZ3ZF?=
 =?utf-8?B?VWZ5T2RWNlVOT1I5dWQxa1VKVmxxZ2lQQ3REdVdnSW9INlNmLzJDR2VEZUFp?=
 =?utf-8?B?alZNM1UxTVp1b3poMGpVQm9hcUZZcmRKSk1RM2I5VjdFNGN4VlI4SHNMUDFJ?=
 =?utf-8?B?QkZTR3VvTzk3VS9BNE5LdUpUSmFSeVgzV1A2VlFEOCs3YU1wS0RWbkprUnZs?=
 =?utf-8?B?NGVpaUJTQVV6Q2VrMDBRa3pQbU05UGtuVjVqQ1ZjL29YREd5T29sdERlTVFI?=
 =?utf-8?B?bU4zTTZ1UmIvelBzWjdTdlN0WU05OWJCVFJkeVJKSUtRYUdESWVmTis0QXZH?=
 =?utf-8?B?RW5iU2VaYUVWYWU1MWxCNmlORGVzQzA0MUQ0SWRjdFRQRWVPa2lTSS8zS3Zp?=
 =?utf-8?B?UkhKOUtxcTgrdEJTVytsRVdncGdmRGFza0huUUp0M2xvaFJKVzNXemxjMUVv?=
 =?utf-8?B?MjZhdnRvTUVsQzF2V1lycWd3bHNCckx0OW1oR0xtUVl4L3hqMXZwSDNIZDRV?=
 =?utf-8?B?N3Fyb1htQzFJSGx6SGFIOXY5R2xJYkRCcmVmYWlBTitGWjVKNVhTRnJiRlQr?=
 =?utf-8?B?bVlrWkVPTGJNenNBdWlqMEo3ZXZ2M1ZoRHEwNXVTZ1JRWUx2U3VyVjdLd3lU?=
 =?utf-8?B?dUNVc3diSG1QSU1QVzdjSmwvN1dpellzV0djYW1Ra2JrMExkNmczMEFXNUdv?=
 =?utf-8?B?ckhMT1pKZVN1Tmg0YWh5SlFxYzgyM0Nham9TR1YyU3ZkbTdSNm1lQUpkV2Rz?=
 =?utf-8?B?YWdvWGc2VEVzcWNMNWxNVkNHQ2lZVG5SeGp2S1NHUEhsV3p5Mnhkb290WGtP?=
 =?utf-8?B?dW1nbFJUVWVXVDJ5RlFBTldGWnJIemc1YjVjYk5ubVpFSGMxczFXbFJ5M3pU?=
 =?utf-8?B?aUxIRUZFeHVyMHdPL0hYY3Z4d2VhTk5HMnBnb2t3clE3cE1kbnVqTkdTbWE4?=
 =?utf-8?B?SE1DQ3lLT3FXVW1yczF5T3hSdkR4T0FDU3JGRHZwWXR4Nk9Ba2VjSE5vUlpR?=
 =?utf-8?B?dUVNdk4zQ1VzT2g0QVZQakJ2dTl5ZFFCZDBZdTRwV1p6dFBTdWU2bG54QnR2?=
 =?utf-8?B?c0ZBVkpGK0JjRk9HZkgrM0dNOVMzTWVHdnJuaFZEME1zSTZVdytWYm0yRWds?=
 =?utf-8?B?SzlRT2h2cFQrckNWWXUxMHFJSlB4ZDlLVThwMGlKNlNSSlJtVmZhSDVhUFNS?=
 =?utf-8?B?MUwwYVZNK3hjWWxhRzdyaFBadUpLamxVRjJ3NUJDSStGK2JPUGo3NG1XYno0?=
 =?utf-8?B?TFZCazFUUElIVkJYRnZYenYwVjZEdFJIaU1tSnNCay9lZnBjWE9nOFh5ZGJD?=
 =?utf-8?B?aGpoTzlKWlh0RFZGQk5XMzdDamJPNVo5aEo4QlpPaVlkMm51TFRTbDBxSFNX?=
 =?utf-8?Q?a0V7vrRb9+uXv1RGvrDrZ17bK7t7VFmw?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VmFDUGx6RlN2TDZWRFpCTW15MnFZdm9EY0NJYUFhTjBSU3Y0ZEZUWldqamt3?=
 =?utf-8?B?TVZyM2dLZGFFcEFlQlVBVHdlWFZvQTRRMnFiU2NoTVFYQUprRkhzTFh5YUpE?=
 =?utf-8?B?VVNXNzlvY09aOWdxRlpUdjc1TUh3ZnVMalBqRis5dkg5aGJPM2hVYUdETGQ3?=
 =?utf-8?B?M0dwa1h1ODNsOHd3QnE2TjJzRU1uYjdEdGFqM0tCdjhtVDlUU0t1MjU2UC90?=
 =?utf-8?B?dHFHSGxOUmFHNWFYNlVxNldLNjhkVVZnYzNBOHMxTEdOcnJSeVNvUEtpTXBv?=
 =?utf-8?B?aGwyUjdhRkJIazRLUDJ6Z2VST1ZnUHRRQzZQNnNPc3RCdmVYdHFscVByQlZy?=
 =?utf-8?B?OXNsY091ZnBiNVpQYk55cERCL253amkzUU9lamN4eGhsRmVnVzBXa3dpZUpy?=
 =?utf-8?B?NlFGL3dGc1pzL3JUMlZJcHF1UUFLR05HZGsyUFk1ZkxCWkVyOWM5NzB6eGFD?=
 =?utf-8?B?U092TkIxcFhHbDY2Y3FOWGtnUXpibmNDcE0rN0tBOGJyWXYxUWVVRkJ2V1px?=
 =?utf-8?B?UENoQXZSb25ZVXJVa2ZpVUNHWXo2RTNBL05pOGZvQ2RVMW5wL3h3dkQyWUY3?=
 =?utf-8?B?ZnpiVWZOWXU5RHVvcENrb1psMWxWSWN6d2taS0FZZm94YXpNUmNYRHVFQmhY?=
 =?utf-8?B?VXdNU3A4bDFZZ2UrV3FoaGs2N0IwcGZhaHgyQm1Cbk5vYjFOZytNckY4Mjd2?=
 =?utf-8?B?d0VTQTNUbFZ5OFI3UTZaZ0UreFFRaVFsNmEwck82VXYreWkveEF6NGlNLzdM?=
 =?utf-8?B?VEtpMFhET2YzU1NuV2lqZFg3L1FRa0JYVmJKbjcySGZIUHhsYUJxeEd0ZWUr?=
 =?utf-8?B?SWtXRndJMWNrQ29DSElidExoWktaa281SGVxZStEVUNYb2VHbEkrWnVIcDlF?=
 =?utf-8?B?aWk4WURGMklaUEppYTZOaHBlTHVGWGJnZnRhYmc5K1VjNW9FMXRRSlNVMDBU?=
 =?utf-8?B?V2FjeVRnbVlRWTBjRzRZMzdoczFHNEZqeTZxYTk4SDIwMFM4ZXQ5d24wRnFV?=
 =?utf-8?B?M09QWEN4R2dEYzVUeks4T1ZEN3pxZDBhdHpnVFhSRTJBdUNsQXBpWW12aWJQ?=
 =?utf-8?B?MFNJcnFmVEZtWGtPRUpmdyt0M0o0R0RGN2dIWVJKYm4yM1ZDb0xDM0lGc3RZ?=
 =?utf-8?B?RDQvSmRFaUpGaUdMWlJ0b1BoWlFGakhWUHF4eDFYZ3NQMzRDa1BKOHNRcTh0?=
 =?utf-8?B?dllLVEJBUmU0S2JRVDlkVEdDb1YwSVhOZVVqUllSdDdDNHprMy9VZ1VqczNk?=
 =?utf-8?B?WTdyNFM2RW9NaFlQTWswMTZXM3g2ZmMzdnI4M3JMKzlFc1dWam5PUmVyNjFV?=
 =?utf-8?B?OWx0SlczTEZWRFFNWTB3bCt2YkNSYmt6Sk9sMnhDSUkzbm9Ua2x4dEJWYmN2?=
 =?utf-8?B?T1g2ck01ZWVUNEdpSHg0TDU1RFJmREVUTHBkK05pQk43ekh5U2NSWmEwazE1?=
 =?utf-8?B?UytuV0dWNHdvRmRFY3NXOHgxOHRTNkJiRG1HTlQwUmZyTUY0UlJNMmVhQVhP?=
 =?utf-8?B?bFZvdUoxTDI5R2RTMlNoa0prKzl4WmZlNFVFUEgrWE5RZ2wrZmx1cW1rb2pW?=
 =?utf-8?B?Y05nSXEya00rYmtaTGxDbkFmemFUR2hGM3NUQWZxM0R6cmtmNytISFVyZk90?=
 =?utf-8?B?NVhkNHM4SkFFWGJQcTNoV1JQTndUcHpXUHZYVExjajhIcnc5QlZsY2pWYmZD?=
 =?utf-8?B?d1RVUFpLaVdNenlBZDZwU3BYWlB4dGgxTlEzSm9NSFdnd2c3VnhxRG9NUTF6?=
 =?utf-8?B?dFRjbDRGeXJ0MGlZWGlvcVR3M0pLdyt0SmxOcVNZVmtjQlBwVSt4TW5EU3N6?=
 =?utf-8?B?SWNoaW1zZjM5ZStwTmFhMFUrYy9pVlJYdUNVUlExV0xkRUZDcURXK2wzRGZk?=
 =?utf-8?B?Q0YzRWNuejlIQURXZ1JBT1NUVDBjMVZZdDZUMmFFY2ozRjJheWlST2JsYUti?=
 =?utf-8?B?Rk8xTE5RTUY1MVI3NjcxZHNBRVBKWnh4NUlWangwR3hjWjk3VUs5VDVlRllB?=
 =?utf-8?B?OVFSbWtwT2lteVJ2T2VlcEtMNGFrclRFR1VSYVlYUmZueGtCcC96cWF4U2Vt?=
 =?utf-8?B?MmZETitKWUQvbGZZWCtqbDgrdStuV00zU3ZBNllXbE5MNDdwVW9PVEpBbUVE?=
 =?utf-8?B?cUxucFhtRUZzU3dITktlVEFjYVE3TXI4RnYvWUlWL0NRNC9PN0lsTHpJVUxl?=
 =?utf-8?B?OHJwSDZVa3czYnRxNzlkcTczWStUQjNtL2tXRHlicHVEWnpBajNsa2tNV3Fz?=
 =?utf-8?B?RitEZWFyRllLUGlGY2FmQnVZeEtzZHNTZVliaHltZlBZYmwwRkpXaUlTRzMw?=
 =?utf-8?B?TXRFQmdsRkJzL2d3WXpIaDJFRVNjdjUwZXhmeE9zNjZIdkdWQWtQUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: beaf9395-8870-4856-b3e7-08de4df26241
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 13:40:56.0328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ri28MoF1wKYo5n58JvmScwcpCLRptyclKSunoI4UKTBg8oWKsntzRAY6yRXT968DpwtMFbYIkUXW7zqtHl0PL5AYtnUn2gw10CmBjp4ff2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10515
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 07 Jan 2026 13:41:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8406

Hi Robert,

On 1/7/26 1:51 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
>    wasn't sure where to ask this but since i read it in the bitbake
> manual, i figured, let's ask docs.
> 
>    regarding using wildcarding in bbappend file names, the bitbake
> manual insists:
> 
> "In the most general case, you could name the append file something as
> simple as busybox_%.bbappend to be entirely version independent."
> 
>    ok, fair enough, that appears to imply that even in the most general
> form of wildcarding, you would have the underscore just before the "%"
> wildcard character.
> 
>    but i've seen a number of examples where even the underscore is
> omitted, such as in this search under the meta-security layer, where
> the final line shows that the underscore is missing from the filename:
> 
> $ find . -name "linux-yocto*bbappend"
> ./recipes-kernel/linux/linux-yocto-rt_%.bbappend
> ./recipes-kernel/linux/linux-yocto_%.bbappend
> ./meta-tpm/recipes-kernel/linux/linux-yocto-rt_%.bbappend
> ./meta-tpm/recipes-kernel/linux/linux-yocto_%.bbappend
> ./meta-integrity/recipes-kernel/linux/linux-yocto%.bbappend
> $
> 
>    so this is clearly legal. should it be mentioned as being legal? or

It's been used for a while (had this in meta-rockchip for years for 
u-boot, but that was not what we were supposed to do), so I would be for 
documenting it.

I would add a note about really thinking twice before doing this because 
it can match more than one thinks and impact third party layers which 
asked for nothing. E.g. the u-boot%.bbappend we used to have in 
meta-rockchip used to modify my u-boot-cherry-es recipe if I remember 
correctly, which is typically not something you want to do. In the 
example above, linux-yocto% is probably safe enough as I am not sure 
people would name their own kernel recipe linux-yocto-something. But 
linux% would be a no-no in my book.

Cheers,
Quentin

