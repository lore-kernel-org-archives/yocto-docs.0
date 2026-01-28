Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AA54D3F06D
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 14:15:53 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14230.1769609743809759359
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Jan 2026 06:15:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=SatKheEk;
 spf=pass (domain: cherry.de, ip: 52.101.84.32, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8UCo/k+mzCd5VJvhoRmWXRn7imqVps5a+53yMXj0kKu+e2XDp1RP+hTcEmMdIahFvQbG7N8sRsCnRDKf1Hcf0328iN8JmMn0chP7nAWtRWT3HEnd9KIKcIGHQzMppukZhYT5otP3Zv40IkfksPkNX8qtxfUohW4EklXvmDXZ9l6Drb5V2L2V7sx5Kmc6CNujrUh5/8rv1RmuZmYwHqTtzmKnygeen1pxfUv00Vaw3Yyt84wRpnLXd6acLoGvNX19WXVbheq5iKIqfjZS+IjIQqfB6L11xAS3BJYhgo5MJc4vvmT3sKz0+8+QZ1OU0zAPlILvzUSAwMsSLUnh9ziXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=28KNDKKnI7SaqkKfax8s++v3j8O1MitSsn+J1LPz2Zc=;
 b=u1e9oQ3G0jDlxG/msfpESGBZP2pF9Rjq7bJzXsNYhPNU0qqBrTjSZLBXCnnRsF4Z9LExEVwu2uH9Nd1yHSezG2DhHncRHD2DZPDvqGQMGy5NLwDtDA6thlsM1/PvGE1/zQoAAb7buB0ETO9viDeHXceQgfyT8DoKaYeHrv3b0ZZtv2lKNr4L/NtAY16Q1aOFMPYs6TkR4/hfBgwd+l13lzMZkQ6H0067cwttA5qroA9ptDHeWZzOS35rAOq6S61P3glBjGPpCakxSUWiHtipkReRc8DAJ5eqRyUznfQImlaKLrbXqEp7XPJQF7J1Q4HihvQqBFycpxyABc+WK8IGKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=28KNDKKnI7SaqkKfax8s++v3j8O1MitSsn+J1LPz2Zc=;
 b=SatKheEkqzVwSHZSe9LzlmuEHaIJNuxiSq6IIs9VfyoCFTUzUHzFXNvqzM4v5OnoFWKn3MkOFK2KUVPYWN+BDQzUXv2DVzrPCcY0XWYE2qK1B3E3ohpiW2bDkvlQdkbh2XrSlqEb81n6E2Rjm+8wql7X3eBKx5zGGfWJm8i/ToY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AM0PR04MB11996.eurprd04.prod.outlook.com (2603:10a6:20b:6fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 14:15:40 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 14:15:40 +0000
Message-ID: <0eaac087-3b92-4553-a5d8-8e9d69033abe@cherry.de>
Date: Wed, 28 Jan 2026 15:15:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 46/56] ref-manual/devtool-reference.rst: remove
 obsolete poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
 <20260127-remove-poky-references-v2-46-74bf80cc4e5a@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260127-remove-poky-references-v2-46-74bf80cc4e5a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0343.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::12) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AM0PR04MB11996:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fa78800-c6ce-425c-27d6-08de5e77b769
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U2VBSmNTcTNRaWhoNmE2SEZleDYvKy9hLy93Q2VJYlRJOTBBM3B3Nmh0VjU1?=
 =?utf-8?B?Q0NFN1FKSjVSNkhNV1NrcHp3QTRlQW05aWNKT294Y3czL0dBYndJMkp5RzFo?=
 =?utf-8?B?RlRLREpBZHpqOGVxVWErT3FmbkxTQ00vR3lVWXphNFNtbU1FNlFPUnNPL3RB?=
 =?utf-8?B?cDlINi9pV3F4Rmg0WXZIdmVsSHkzWWFjcHlmR2tyNFJwRXJxMHhpYmRqTDh0?=
 =?utf-8?B?RDVUeTdaTE85b0xUWHBMclhnRkxkRUNSUVN5VWpodEZXWThROUVuWm91T00r?=
 =?utf-8?B?YS9WZE5iOTltQk1rTndBUUpUc0UrSzJWL2Joai90VkFabjZlYUlrUHR4dkdO?=
 =?utf-8?B?UjVVdmwreFBVRmxzWEFvY0RoZk5ub1dkN01uNlV0ZW9jUXE3SUNsUWJXZnNw?=
 =?utf-8?B?WERYMnA4Z3RwRERTMzdzRHpIZkFpMitaMTFmbTlzenNTVDV4QXlSODFxMzAw?=
 =?utf-8?B?YlB3ampsVVRXS0c1MFEvbmNuNGRwWHhaeG05cFB3OXZ4QUxSbjl5Tmp2TVZS?=
 =?utf-8?B?S1VBMHZpYVVnakpaM1BkZFdpRG1JZ3B6eDBkdUlFdGRzQmRONGVkUlpxL01K?=
 =?utf-8?B?R081WEZNdmh0R0EyK2o3TlhKVnV5bUhVR01DUTcrVmh0KzRQYnBXZnBLNFpv?=
 =?utf-8?B?emU3TC9FVHU0N2VFbGdHaERiaHl5WlM3Z1VqdkRzNGt1SlZOQW5kdHhMNHRM?=
 =?utf-8?B?Mkh1Q1FRd0krSldsbjFDV281L1JraXR5S01XclF4ei9oYVNCR1MrQ1ZZS1pP?=
 =?utf-8?B?T3N0aENNdVVHNHVmNk9KeEFDamozaTFhbTFpRVYwZW1iRG1ZMmQ4R29GVVdK?=
 =?utf-8?B?VFlGdHJVNi9uVXMzR3hoNm13VUtaNis5ZFo1N1lIRng1YjJtZ2x4Wmk1bDRJ?=
 =?utf-8?B?bm92akNxZDJxczlUMUpqSVdUdEI1Yld1bUlWSXRrRDloak5DZ00xWlZ2a0t5?=
 =?utf-8?B?eksrdDNEUGtkNTQwemlISUx1YWNUMURYYmFtQnh0aHYyNVFzTDFTV2pMVzV1?=
 =?utf-8?B?YXhtejlrOGdVUWRYNHVPdGM3QkJndFcvdXpVUURlOHhvbllrejczN3JuaGsy?=
 =?utf-8?B?Slhvd0hoU1p6ak5nZmNEa3JtTXQ4R2Z2ei9SYjk1dXpIMzh4a2JLQ29vWlRo?=
 =?utf-8?B?N2MzTUo4UFZxVlB6bmUxRERWTXZBV3FURStaaCtmVnBBYjVLV2NIV25rbU5J?=
 =?utf-8?B?Q2RJMUxrTFQ2VXRCM3RMYkFGamtwNE4wSkhVaWdmSFFhVktaeEFQWUEyek1k?=
 =?utf-8?B?UUN4eXBYSWc2dWd3SmlxSm5KaHF4V0N2WlU5aFRENnpCaGRMVkFuMlo5akpr?=
 =?utf-8?B?OUpXNldOSlh6bi9CMWliczVhUi9weEF3bnJtYzgwVERuTmhhMTdvSklnWU54?=
 =?utf-8?B?SXpWK29DM0hDTVpVaHZ1elJpZUd6V0NIZTkwa0pnWUpTalFNc25jNlhYaWFv?=
 =?utf-8?B?dHh1dHdWRVMxSWI2Y1RZYXpKZDBYRXRZa2ZjNlNyb0dmRmc0blhscWJqUUVq?=
 =?utf-8?B?eXFQYWlqdWVQMFp5eVpvR1JUdS9NSnVWNzI0QmlscTc5cGFmYTRXRTNpdUww?=
 =?utf-8?B?c3lWU0V3NFJtYS9VTEhvZHdKMU1RTWxoT1pCSXUyM2JuY3cwdWpMRGZRc01s?=
 =?utf-8?B?aFM0bEVqd01hSHB0dWhScXhOVzVXaGUzTU0zN1ZGVWxnVDl6R2ptSGd2ZjJR?=
 =?utf-8?B?aWNZRVFvV3NjZzRldGFLeHptU3ZoZ25Gd1B6b0RabzJsUTg1eWMyQ2VmZTdu?=
 =?utf-8?B?ak5aVmg4WGl6MUE5eDZDRkcxcW5qQ1RsT3lTd1YwMjJOK0NXTElFZTNZTzV4?=
 =?utf-8?B?eWg5dklZRThoVkJmYlZWaElibzR4b24yTWV3TFZSZ2hkb09UQ0h2MUVuNjI0?=
 =?utf-8?B?TngzUFp3TFl5Z28xUG52ek9qMytKWlBlRnlReSsrdDZtaVBLRElia29TVUhD?=
 =?utf-8?B?MEt2N3VqV1pGaUt6bnVCeUdybldtdFpHL0R5dWhXaVVTeUJ0NmdVQnNQOG5a?=
 =?utf-8?B?ZXBrNDdFNkRoU1lxcFcxRVlvaFUvNFpZQ2diTDZnSUQ0WWNMdEdLWE1BNXIy?=
 =?utf-8?B?L2hmK3JhQ3p2N29JbkY1K1M1UkNjaFlOSVB3QjYrMVBoWEt3akNVTERPdGtu?=
 =?utf-8?Q?4x2A=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OHpvNHhobk5uL2twRFRNdng0T0tMQmkyNTA5aURMTWJHMVZ3V2c3Z2ZaM2Ji?=
 =?utf-8?B?aWd2bGsvS0lCd1VvbXpuOWxhTjBBcS9iRlI2Z2kxT01YSkFjaGdKb3R2MWxL?=
 =?utf-8?B?RVoxYiticTUvOUxnV1lFNnFLaGpVOWcvM1U1am9Ecm9LL2ZvQmd6VVkvT3ZQ?=
 =?utf-8?B?SHVnSytFZjdXVkdnL05FWW9qVk1HckZZOFFoV00zejNWMEhnS2RXQlhzTGhE?=
 =?utf-8?B?YmR2VmViMEZwM2ZsRldZcnFEZ2Q4VFlqdkZ1TEdHelYvdTV6eTZwUmxQRmdG?=
 =?utf-8?B?cklXb1JlTkZJcDZxWk1VeTM3Q1B3RmFuYnBZMnN2UzJtQTZTWitOWG9rYTNq?=
 =?utf-8?B?dFQvaEl1TU1rdXlydll3ZnhZdzRtbkMxbTNreGM5Y1pXaVg0cG9BV2R5M0x4?=
 =?utf-8?B?bEl5TENSRjllclc5ZTM3aHFmTWg5d2RGa05BVjcxUTNleFVMYTNkQVJ5MnRx?=
 =?utf-8?B?YUxpK3h3cmprSk5xUGtEQlR0RUhsSU5QcTN2aCtlZlAzOHRSSURxcE1Rb0NM?=
 =?utf-8?B?dDB0Ry9UbzdEbkZIRjZOaVBVd1Ard0lXSldXaFlYaEFuaFVBNFNuK0o3UndU?=
 =?utf-8?B?VG45SG5DSVhPUmRrN000amtXWi9JS3ROcmF0Z1V4VmpJRzNHTVpHVXBWWXFU?=
 =?utf-8?B?d1B6MmIxbVpLNmNHV3RpSDBxamZEM1hmbGprbWJLak5saCs3bmwyNHVNaHlZ?=
 =?utf-8?B?Q24xNGlTeGpvazRoNzR4RXIvU1QwMUhadVkxVkp0OW02MW1SaE5Rc1A1U2Fj?=
 =?utf-8?B?TmN6UXRLcWdQOHNpS3AxZ2hHcjFiajFwa0JlUzdueEhXNVBnUElmMlNnTjNM?=
 =?utf-8?B?cjZMcVZETmRGelBNaUVySXFWdzBPMUhuaytrMlFtYkg1Mmx4dnpKUmdqdmZW?=
 =?utf-8?B?dGREd1h2TDZjcGZsNXlpbHBZOUUwOVg5bzZNNkNTV2hIOWUrVzRPR1UxZlE2?=
 =?utf-8?B?M2lKZCtOUkJUTThCNEVVVk1mWVhHQWZsVTBiVXU2dEpsV0tMUG51VEtzdjIx?=
 =?utf-8?B?RUFaZFRDNXJCTFJsRy8rTm5BSU1uWHdYQ2tud2xKcmlNNnFRcXpDNHBnajhL?=
 =?utf-8?B?TjJkL0hST2pHbURBSTNCRzBMTmNGY1dQT1p3bk13Ri95TjZCRjE1bExFSUpU?=
 =?utf-8?B?bE1yaU9YRGJFam9hUWNQWmRiY1RzNVpnVjZVWHpXYlp5NThuZ0wzWDJPL0ND?=
 =?utf-8?B?QkJNMDZoMmxEeXVhOXlrcExHRWdBRk5DOThIam5mS2ZnWS9oQm9iS0ZuY3BD?=
 =?utf-8?B?SVRwcmUrOXZickRPaWRrd1B6eTNYS1Jiek1RZE12aE9BUlNXeTdiL0tXUldN?=
 =?utf-8?B?STR1UE5zSmtGemZCWHdWVVlpS0RhOFFTR09RTlpKMFBVSWtML1B3VDdjZGor?=
 =?utf-8?B?THZyUEdrQmVWQlE3MkoxUGpsUE50TjVOMkJTS2c1bWV3RHFqR0FpRjdPbm43?=
 =?utf-8?B?dG9PeGtMbDNtbk16c3hBOW8rR1BxN05sK3dwQTNObHdLTHJrblpYSmcvN3Z2?=
 =?utf-8?B?aVRiQlduTU0yQUYrckdiRm5CNzdnYk9iNWxTeEh3UkY2RXNPbm9ma25tTzVk?=
 =?utf-8?B?N1RJYlZnMElyRHF6L0RkUm51Rit0Z1NsTGZOa0xjbG94WEh3NUh0UUx6Lys1?=
 =?utf-8?B?Y1ZycExrRnhTZ212emFLbjJ1Ujh1QUtUR2Y1MWpHcHIxbnVwT1UvaEFpYkFL?=
 =?utf-8?B?MWdGV1dyQmY0elZiMDhtcm5QNkhKOXJUMk1FTlkzS2lBbE1oalR3WVM3c0hZ?=
 =?utf-8?B?d1haZ3pYSG5jcEJyUzArQkdpVksvekkyZFdWKzRMMTdJZGZwOTcxK0k4Ry9I?=
 =?utf-8?B?dS9SZnBiRTEzTVdLSlhpRW9lRitFMU94TXVVYndoc3V1dGVRUHIyWXJ3UHJZ?=
 =?utf-8?B?SHJYSFdGdDhmYytoK014MEhFTm9FSW94ZHZBQmFTendMM0hIMEIveVBvdlBI?=
 =?utf-8?B?Wll2RzlwZjN3SG1YZkd1TzdTZ0Qxb3BQWTl0TmRvempodVlXazQ2cTNDbUtG?=
 =?utf-8?B?NzlFdnBIYUdqaEczV0lEbWx1OVN2c3RCZDc3NnViRElxYVJobVlVN3IzYUNF?=
 =?utf-8?B?OUQydGVMekxTS1gwaDFjRmkwalA4YlVMTDk0NEZoS2FkUit1VkN3Y3Q5NXdG?=
 =?utf-8?B?RDRVNWVGakpFcFkrN3BsQloycDM2c0wwTlJ5UmI1OXlseXI2L1YzUGI4K0lK?=
 =?utf-8?B?QXpBQjVQZzlsdmNYa003SEN3REF4U2JBZVBHSkQwVEhXZ0hsYlE3ejJTS3hB?=
 =?utf-8?B?bWNvVFhGOW4wNTE3QWpETHBmSXpoVk5pbjlMVnZxRHN0S0ErSERCa3lYbitW?=
 =?utf-8?B?K0s0ZmgvSXR1a25zN2REWU5OMW9qQmNIK01PYm42eFpya2V6R21BaVZyb3py?=
 =?utf-8?Q?rCJMPeFCDW4JK1qHw2VCM2SXrsoo75OfBidiU?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fa78800-c6ce-425c-27d6-08de5e77b769
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 14:15:40.5992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QpH+A01pSOhudmSbWCrXbXc2T/P0pFhy5JySuKQER1W6UfAFGgNJYf0V/cHoGs/Sa6j5VEX8VNr8e/UYODJtM+kpkhUNLlbOGMxLJKbVlGM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11996
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 28 Jan 2026 14:15:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8771

Hi Antonin,

On 1/27/26 9:19 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Refresh the document now that the Poky repository is obsolete.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

