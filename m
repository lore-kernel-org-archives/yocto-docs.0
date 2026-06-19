Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB67BCD4F26
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 14:45:35 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.59])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44138.1781880330013641887
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Jun 2026 07:45:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Ce7CnLuD;
 spf=pass (domain: cherry.de, ip: 40.107.162.59, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hdesHwzmpb/F9huOs04JLUizE8ltmnvSBnr89Iz7gJi/awwAlVOYlD2k1WsMPoeh6qET4ZKyPlUrJngl9b5zi2TJnJ+wSvwgvHUFmm4sZespokdb+osquYe6q8tMWmPDlLKjZ9MF+GSH12TE8ea3yjoDXzdRL4P3mW2nmLDxKD640pLV+fBKh3kanO+ByfDDVxGfDSP84FzwonmXpuJnWgmNoUT8ckVkp+wwREV3qzSCYAJjdWUD9CP5+K2TwxrOMiuaHFLz6KxHIIyCm8pcLIay10XuTsAhl6P5eYnvuIQ27m7CHhAjIUNPYlFpn35G9b1d4/VE3VHpPtw6r1dTdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKmAVivIy7ahqfpNEB2jsLqiA6BobjCk33mthcI1fx4=;
 b=uW7PdLbyvIs4UKkzbxe1SFBdNe18Ff7iwCxSsOCrtGrYwDjcGax/qz0XvNH1d7JTVpz/ZFKcfA16imL+6OvphQDqxbvVGAZbOma+CS0KYr4s7dDdtEHNjsWF0t4o/lMynPWqQKOZ125C6ll4qmvSL0GSMBMuodvwNU8lBHtTatEsqufhuodyj80E0WPiZk9xu2Fsof2XA1chBG4ufGCawW6Hs3l+9qnIszAQAZx7T+Q57oIokCxOJ0B9xM1iOKB8OqtIUwddLxvfvAkwtXvKxIRJwUcRyBLB7IbD9yUKAlrqf44wu4eK0tXEETDOla7JslR7mZ+pLODePiHToHJf8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKmAVivIy7ahqfpNEB2jsLqiA6BobjCk33mthcI1fx4=;
 b=Ce7CnLuDe1KCEtw1uoT3KsXlc8aX5MtlngbiJgZ5eVQXthL3zbkA4P21nY8k8L4IiwufSekX1FIFk5x9e57ApCp5Bm9CN5Pv3+80ttv1pqRWScmrYV5+LKqNd98i6NrkyKBEs65QbmQcF4U+OocUTHSj0J4F5Pbpiy2didZBlls=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by PR3PR04MB7340.eurprd04.prod.outlook.com (2603:10a6:102:93::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 14:45:25 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0071.010; Fri, 19 Jun 2026
 14:45:25 +0000
Message-ID: <791d8225-1072-40a7-9e57-d53699068584@cherry.de>
Date: Fri, 19 Jun 2026 16:45:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] dev-manual: for testing local changes, refer to
 devtool section
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <d5b8fa2c-b21c-74ca-edc1-0273e9bfe0e1@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <d5b8fa2c-b21c-74ca-edc1-0273e9bfe0e1@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0094.eurprd04.prod.outlook.com
 (2603:10a6:803:64::29) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|PR3PR04MB7340:EE_
X-MS-Office365-Filtering-Correlation-Id: 588477e0-4739-428f-56fc-08dece116613
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	/PqR0Qk9ga+karhT3X2wE/l7bj3RpvNSsDmDN0JCvsBYBgaQbOH8Sunpmj/NSu2/jtDzQOP+hbKZ+TM3YpEUJ4QqzpEuVdfIYMIUQL2TQ18KpBkeSEVxtmjwbzjGT+voFoO7lnGELFE+jVlzp17Xd0SaWuCpIzPIEpzi7nqb8BrljacEdpXU1rdlX1I3yHLRgVJ5zzlYU+sISAQMdp4EwwnTvDjxq4LHHD7XB42NXaGoUyou0sexu48zsBmqbHl6Jgb+UCYiFxsIuM2KKimYs4IZwg0m79bA+nBsjeZBkwtvaNFDwditEil9fi/f++5Vac55HQAWuaMxOHdWfkXodBcAkqG8qoUeaCNSGYIYC3rrRmf3GBPHIHekUtnOb30DyDCkI267ITIf/MvjTauh4x1KOL73UqurSqUtuzukzRooA+UCD3X/nOq3RdV2lcIfPUUFOx0RjG56FRbsTgh0CNwD8OgyBxNUesDEFbcOBt4uX6uzF7W/4NxEnt8yFahoUPzsfxFChoz5Ixa4r5wg4GFInvfIumCYr8SHbsTo0ghu/4EHiUnfY+LgScvUH32Rrz7oxy1mrtNavwmf6SD8vNy7KKpKPcRrDtDFNRSe25EB8c8OCqOAs7ZIGdkI3CRzuYPgWBT0a3iPm/YMA3wjoIR74ZEWkEk8Ti4MqCgQw04=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YzFxNWM5WVU3TDFSMVE4VnYyVFkwbVN3R3VrYU9xTWRkVVdZUnIzSnBLTjA0?=
 =?utf-8?B?c2NXQlZMYWs2VDRocGI3QS9wVFJ3WWpZbTQ0TnBidmpRZ0N1a3ovSGxPeDU1?=
 =?utf-8?B?b1oxMTJ4WEdHd0JlZDMxQ2dHa0s2eUEzTk1UeTdvMWhDL3lMOURzZy9qVnFM?=
 =?utf-8?B?L3F0aVhTQ3ZJWVBYa2NhV0ZFZjRlMDR2dTJuOGJuVHVCSEhPTDRkV3htcGk5?=
 =?utf-8?B?TG5NTmExWElQZXY2MXd4ZXpHenErYlMvN00wZVRZN0s2WDZldGJNRTU1ako2?=
 =?utf-8?B?RHZXRW4yTTljYjlMNEc0Nm10NTJ2QVA0OVEzVlFFSjRhTlBVWFU0Y2lVRXJR?=
 =?utf-8?B?bE1nOFBYbEVXZkp3eWYybE9HeG9lZUxFWWt5MTFyczNFdFN3b1FVOGhBZ0Nl?=
 =?utf-8?B?Nnlzd3pYcWQyTDBycnNGZERtbWtvN1NHQ0lxTmo2eUs3MTBjOENPQnVldlFl?=
 =?utf-8?B?K1UrK0FrVXlUSmNSbnJ3RjUyQmpHTnNjTDlpRjZpUjh1dXlyMWdQNjhZdHFR?=
 =?utf-8?B?Q0hzOVVmb2JsTlovR1MxVkhtTUVLQ2UrNTkzNFdGMk5CakcyMUUzS3dIOXo1?=
 =?utf-8?B?bkFRcG1DQUl3eGFzTkdONkEyd3VpOHRJaENQekU1dXVvZWZoVkFOZCt1bHVB?=
 =?utf-8?B?QzFBNXFYdUgrME5SODd3SGFJMlQ1K2x2ZFptVXRWK21DbkQ3RlFJRFltK0w0?=
 =?utf-8?B?aWVIbC8yUUtiMnR3VkRQdnhzdFVKZDNCS0YwbG9mRHIvRzFPVVpsU0ozUE01?=
 =?utf-8?B?ZEtLV09jcU5RN2YzaTB0UXhwZE5XU20xdGhHRVV2V0VQbTFZTnd3R3RNTlpG?=
 =?utf-8?B?bDNOcU12Umh3WHcrWkc4QlVvVDFaQytHdUJOY1JERkxlWHA0NGxGdFliMGdI?=
 =?utf-8?B?WVRrdTRybkh0ME96SEZ0OXFVb20yblhyN0JHeEY0WFRoUUM0ekV6ek91N3l4?=
 =?utf-8?B?Z1pMcld4S29NL0lVQ2s0blo5bUFuRFRBemo1MEdJZUYyV1dxSnV2SDJkODlv?=
 =?utf-8?B?b3J6YjAvZExaRUNvK0gzK0Vod25oNjk4Tlg4bHE5NDRWR200Y2FVOWIzWGI1?=
 =?utf-8?B?V0tRYVpCc2VReFc1TEpxaDM1VUNwcjNpSzBnNVRudXoydWtTVkFtcm5henll?=
 =?utf-8?B?OHM0WE16RHpkdTljTy9sN1NNNG5acVkrQ1ZXVnY4ME1ZUmJmSUFtb3gvc2tC?=
 =?utf-8?B?TTJLQXRaZWtpeHB6OGNGSllGcTdmVjd1U0VsTksrZk1mdmd5TzFqWCsvMjRE?=
 =?utf-8?B?a0NRbmYyWEpGMnFKMWlkT2RNYSs4Tkt1bDhpaFZDbXVQemdFY2VxU3dQTVZH?=
 =?utf-8?B?eFBLcUN5a3FLN2pWbWtWekxLVUdIeStWMzQyT1Q1Wmw2Sk1MdDFsZVQwYWdm?=
 =?utf-8?B?R21WYkRNNVNLdG0vVGZUYmtuQlBRTk5QSFdyMHN3Z1hYYUF4R2ZNajkvNHU2?=
 =?utf-8?B?WkdkTU1hYndibTdMOHNZa1N2SDRqZ3ZaRkJma0ZJTG9QRDJ4MWZuL3hVemV3?=
 =?utf-8?B?Q2FBMTNLcE9PYytvU2hUWGc2L1ljZlFvYWIzdU9UMFdTUDUvUEJnWThDL08x?=
 =?utf-8?B?T1RMQWEyYnY5Z1BXRjhZcjNxbE12SjJKNW5IM1AxNjF3WDlYdnYwN21nN0hj?=
 =?utf-8?B?S3QxVkliWjJKUEUzTUFWUDFnNllqT0hFR3JQZHZ0T1h6TzhIZjdrWDNoc1dj?=
 =?utf-8?B?Y1pvMHpObEg3M3hYZkkrY2RwdmNzdENUMHduaDJqSFl1QStObmRnUDJFMnhL?=
 =?utf-8?B?S09xUjFVQnArYVlkUzhSWEgzeGlGdDFES3h2TVFJUnpSSVpRd0ZSazU4NzRM?=
 =?utf-8?B?dUlZUzAycmMyZzF1Y3hmTlZVTGNuMG9HaVBPTkJ5UUZDS2wzU0ZvMDBMeFBG?=
 =?utf-8?B?SUVuWkltZTBBSms1bmd3YUNQNVFmZlFUc0crM0g5MjlkS0tJT01RTVJlOUxK?=
 =?utf-8?B?dXZibjhlN2ZQN0t4RlFBN1BVTGpzZXYzNFFwUGtEaFlJajNPSHorQ0lmMk13?=
 =?utf-8?B?bHBDa3E1ZzRwM1NkaEJTMWx1YmZoMkNrL0c5UUJ0WWJRSmx5K0VYQmR4N0Fj?=
 =?utf-8?B?MThkREhZcHhhbzJYekM0UGZUVzVxOFMvNE1EV2xxSkNVRnBLeS8rV21EbEJU?=
 =?utf-8?B?eUFrVVh1YklmU1NTYU9EdzJQOEtKOHQ4VkdpUkQ4bkUvb1psVm1mS3NLLzE0?=
 =?utf-8?B?UmxtbFBNWWh6ckZ2Q29qS1ppYlllRWNaNExicEYzdXpnYUpnYWhEaWJHOWRY?=
 =?utf-8?B?bnlBZ05oTmFwQUV4Q1ZJNnRwT2lsTm84VEcxN2RCSTVzV1RjUFZ3VDdSZ0VD?=
 =?utf-8?B?K3ZBT3kxMlpEaTNoWDVzeFd2cWJKZzA2bzB2TFN4VkgvU3hwNTJwUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 588477e0-4739-428f-56fc-08dece116613
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 14:45:25.7131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SO44pKMUmSMw84tUdfO3kc2l5vva/17usUmLaB+jmZBCzq6EoYBIdDmSJubtcwXaGQUb02r4bufEEm4uGIIOo7kLjXWoAqDZIuUWsSoJBS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7340
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 19 Jun 2026 14:45:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9791

Hi Robert,

On 6/10/26 12:33 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> At the end of the "Finding Temporary Source Code" section, refer the
> developer to the section on the appropriate use of "devtool".
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

