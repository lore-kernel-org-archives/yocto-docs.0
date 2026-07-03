Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40D95C43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 10:17:28 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.89250.1783073838907689646
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 03:17:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=RaqPjb+q;
 spf=pass (domain: cherry.de, ip: 52.101.70.46, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qGzA9Ic3+ncrQchQt+vS/MBvLen7xp7XkXr9CJoWj65PdPmeHh4dRzTSxgKJ2k+NfygzlLnIIVFuWPiZsizSXgI/Ow5PyJE966/VrcP/kqkZmahCXj/+xf6oixkmeNA7bi8oUmfRl8x6x8Kg5c+d4aBi0hk7oxPcQtpYKb6/nmOhcM821TlNq/b276px4i3CHYXokLBia1cNUnK81jzYXJYcsl/L/gbPfjttdRSwL+Woiq3lfcHDExQdI8WiXPzJmzVMVAHXTvJfXioCwsTRdegvL6a6H6Uy5KIo68HbZSKuAnKDwKU6CtCqvq8ajMtkNJiKSBe4f8tjHIn3EaCoRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SlUDkQivlbYVHP0ydRifId2P1VMHsrsYsfcR1ZyWYCo=;
 b=XyMeHdwk3FQMUU3C86eNi4t7UFpFWGsgL+yskZ4m4G+EA7qyyfNXMcvd2RpkFFxoVzDxSKzMxu+9wAhg696bppvk1ADKxmj8oTGeN2J5b3skdeXq9zlxwkTuTkKO8Anz4NgheO9bI2Es9cfwnpfwFV8vtrSyk8acRlLpO3o8dKa7mmABjtYC/0A8S+BvV7MgfK7EaQftwQKG2Ys8s6zq4ePg/gJE63ruUV6tPpMOcK5blzzzSbpE/tsBou+m9XcAGCiB0v6dLH4Why5pzkHzMKqsKyQhQhXCoJwiKSVX+EpYgG5zwZA0TzxCtTgv+kLJScxSmzMULsDfLTz6aeRo7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SlUDkQivlbYVHP0ydRifId2P1VMHsrsYsfcR1ZyWYCo=;
 b=RaqPjb+qSHEBcX+RuOprXq6CAJxcQcM0eK8+wfW5wokZ2q6YAXBmAs+O8ugaAemzJB0Y9XJVSW8sOxM9ezAuuJ+gg6+CJxHa1reHEMvned6UJImK+RYnIs0A1Ib+2p4WIrNUPEaWdCWqZlGCzp7mYHJZsNE76E3F++DgicHOY1M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by PA2PR04MB10123.eurprd04.prod.outlook.com (2603:10a6:102:403::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 10:17:13 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0181.009; Fri, 3 Jul 2026
 10:17:13 +0000
Message-ID: <7fe7f168-c742-4162-b1a8-dd9cf1d99adb@cherry.de>
Date: Fri, 3 Jul 2026 12:17:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 1/3] tools/check-glossaries: return 1 in case of
 failure
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260702-pre-commit-v1-0-0ebd211b5d5e@bootlin.com>
 <20260702-pre-commit-v1-1-0ebd211b5d5e@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260702-pre-commit-v1-1-0ebd211b5d5e@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0264.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::37) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|PA2PR04MB10123:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b9f1396-50f5-408a-0808-08ded8ec3fce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	x3XphHUUx9pdfhBJoiaKQhUCX70WA6hptzEoV7+0KeuET12JlkZAfWwldL78Fk2zXUmzviyZs2/vz1m7GophzPnmXoubPtAqPqnsXnbv0lr7vHHcipP7NQR2Wl3AHRyVQRTRM63eQKum14GD7m43SmH6zZfPRZiOGKGzzWAdmogGEY+lKURWTM/Lhs2Vb9BzCkJgf5cnvmLskuNFHazrjjCoaZ/2EkpEQXcW//+y8V4lAlFgFR8CF26QS4Cy8ZoZKYA0zTZjDn2x0fYAUe2nKk6Knx/rab1y0+46LBIm37lJEt5LvvdB6g1leK+FN2Bqbp9FLbZoScYVLJdD3HzRYzKtjJLp3A/TARBY5Us4lU16YPgZhRmhdKcsYYcmoTcgZtt4RRPLQ+4OszbTFO2o2GvIBO0Ed2PpxQt4bCL+mT3K9abpA1ysuO/df3BaKyyvi+SeDJpJcLzbidWvqZkjGvMfhf9jX5vfasmXYIORymJJ0u6oBE8wqaY5FJ+XdcwZGGmiMJC2b+gcYaQZbl/46ZcZUmHgSKxVL6N4Oo0ZauMsGFpEiiRPNNoMo7Rj9AUo02yyS51xOErAnwdOy4dG/ATtw6cyxMCGbKD3YAUClb1njbOMDzWQiskkV1F3Z9q1sdMmtvHa0JEVyBVcj3D1kWvy3i2nHpNz9g9hlllGh8Y=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?STAyUEcvNnp4MTlQWHhmTjBpajZHSzZSS29HdENYZm9sV093dlpGU3dFWndz?=
 =?utf-8?B?M0doeHF5ZCt0UUR1bk03Y0l6ekYybjZDUGxySWFNY2dlLzNqeXpFeWdUMWVw?=
 =?utf-8?B?UmdnMU9iTjRpeTV5dm4zeEtXd2ladnc2NEdBZDV4dUtTcSs0Z0tnaUtRbnAr?=
 =?utf-8?B?ODVRSHlMcWhvek15MGxwY2t2Z04wVHRlbCszaktNSVBacnROcWlBRFcvYW1i?=
 =?utf-8?B?bG9rNmlUYS8ydllIblFKakU5cGZUeW81bDVCbEF2UWVmU3h4cHJVR3RSN21R?=
 =?utf-8?B?SXUwampVaW9vU3lnTkZoTm41ZUN6MVZSaUlDKzhmWXZGTHFsbFJVUU5sNFdy?=
 =?utf-8?B?eDZ4czN4Q0dlZEVuTUNoMzJENWRYN0xyTnhlcnhZTXFUd2tDSjJCRmt2N3hq?=
 =?utf-8?B?NG1YT2x4R2JhYklzQlNuWk1ZQkZZV0RMVnBwZ3Q0OTh3RFpiTmVxVW4xY2FF?=
 =?utf-8?B?RFZ3Z0UzaXhhVk15Z1FmdEVwdEtzV1I0L3grUnBMY2JuMkovYmM1YVFMdzFB?=
 =?utf-8?B?WitNUG5TL014S0xWRmxpalhCN2hVYlh1aGRLNXkxRC9obko0cS8zNkMyeU93?=
 =?utf-8?B?TGgraW1nMDNhd1QwaVlaZ0hsMjJnZjBxdWI2ay94ejNJaFcrOThQb0FGay9a?=
 =?utf-8?B?MDgvZUowT2E5UE8wcndGUlkzSmhCeWRiVW1VZ0hTM3dYaVRuN3MxZllPN0N1?=
 =?utf-8?B?aVlDUTJSaVdBVzU2L2lXRGVqWHUyU1B0bmYwOVBqMDRZWHh5OWlia0pkNDZ3?=
 =?utf-8?B?bFpvOXJxNlZXM3ZLYlltUDB5SDFWYnVoVllUNWtBcFVLK2dtOHJRZTJxUElB?=
 =?utf-8?B?bjBlVVNuSkorMnU1WUVZZHpKSFdBNmo1UlFhN0JCYTBXc1VLNHo0TGMrMXJU?=
 =?utf-8?B?RndMRVY1OW1qOTNEQTgzeC9vZU9ic25IS1dyS0VhbE1IVWFUeDBxMFFsYmFD?=
 =?utf-8?B?dE52LytzWHB4SktVR0xIbU5nT1pJemx5allWdG9lS2s0a2E2emZNTmkzMzlN?=
 =?utf-8?B?YTYweGJjbXhJdWFIV3NVOWx2d1l1R0pJWXBMaU9DQ0MwTmlxUjh6UVYzajFp?=
 =?utf-8?B?cVVoMWE4Z3k1VlU3bFZ1Vk53aVdEZFlRMjR4VWpyVWVDeWJvYi9sdE9SZ2pS?=
 =?utf-8?B?MWdoQ21uYXcvb1VMRzd4bVVhRWxtT24yVTBFdzEyWWFFM0VSTnJFSnZlRmJQ?=
 =?utf-8?B?R3pGUkIraFkzQjlON2plWGFGbFB3YkNlZkV4cjlvbmtKV2xXaGNkd0lRWFlX?=
 =?utf-8?B?N2p4TU5UejF5NmZuUlFNNkRBaVFwdnhId0xJdUhsRnBRSklSdUJya1pkLzR2?=
 =?utf-8?B?SFI1cWRIOXYwOERob2lQYTVLcW9aSUREck1WRndRbnBzRlJMRjZhNjJjeEMw?=
 =?utf-8?B?U0VidDJaeTFkL0wwTDF3MzlGdWFBRm5LWHRwSyttNER1OElrNDlpWjlBYWRD?=
 =?utf-8?B?M2FXd0FIalhTdmJjTE1FUHNDNFAzSEs2MXhGUmN4TS9zMHkxSy9ldEF3Qm5v?=
 =?utf-8?B?emJmaHVjTFE4R01YelgrN1MzMENQRGh6a2RZRzhzeWszaldBUUdZVUlaMllF?=
 =?utf-8?B?NVFhblI5a3ZiVXVSZmJCdTlRL3RiTG94cDR6OHA0YjdZN2Z6T1N5YTVpTG15?=
 =?utf-8?B?VkprbEpkdGxyUDEzTHMwUnhUN3dZYmxRMmRTNDB2aXVFRGNHT0pEaU5JQ3hO?=
 =?utf-8?B?S0pyTlNYNS8rTmcvTWZQS3RPdXdjWHNwbWw4NGw3TmdxRTA0eHlJYStTNnpE?=
 =?utf-8?B?WHVsUitRZkxJdWhhT1lzWmZ1SzEwK1VvUFJydEkwMEhEZk42OXFtRjc3TlJa?=
 =?utf-8?B?Qks1RmZjdmVZS3cyRE05Qjhlbzh0WlgxYlNOYVV5czlPWmVUV1U4eS85VllD?=
 =?utf-8?B?TGFhdzRxU2ZmY3BNUHNOTllVTnhlWktPd1lNRkdXTndNYk1ITC9wMm9BTC9l?=
 =?utf-8?B?bS9kUzY4d3BFK2tqNFBMdTg4S0JtcVA2U2Y0SHJKdm5GQnFJWjJyUmNEYWNt?=
 =?utf-8?B?bzZyMnp5RkdkVmVhdjUzZHgvd1EwVFhsZTQ0Qk8yN00xQkYwMGp0WHlNckdV?=
 =?utf-8?B?OFRNeDFwdEtUbXlldGpGelJnSHB6b1BrNndLRldjb1RiZVZNOVgyV0VJUFBE?=
 =?utf-8?B?UnI5OVZKd2JveTFocnB1cUFpcGdOazFTR01EakN1SVdwTG1yZjl2bVhsUG1K?=
 =?utf-8?B?WXoram54UXV6K01CWHhWdGRPM2daRUwvZm53Qzd4YlExb0IzTzJwTWxJTE5S?=
 =?utf-8?B?VVQ1M2M4YlNtTnA0M2I4dVJUV3FDNW5lQTZRZGZrM1Z1dzZIa0ZYSkxRWFlE?=
 =?utf-8?B?WDkxSy84OUVnNzRQOWdNbGJEbjZVaWt6NG9qUDNIUVlPV2NQYWlyUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b9f1396-50f5-408a-0808-08ded8ec3fce
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 10:17:13.0820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 03oYPpZzKoV7DsoWDhThXjTQxJUwTg+UW2CiCQ1o8l0t9ndOnowYGw5NS86LTMqW47PAb96We5sd65QEc0Di36Ii6PBaMrG9iSS4lUE/KX4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10123
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Jul 2026 10:17:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10009

Hi Antonin,

On 7/2/26 3:59 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Exit with 1 in case there's an issue with the glossaries. This will be
> used in the next commit.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

