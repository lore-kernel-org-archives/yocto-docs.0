Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 445FFD132AA
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 10:33:52 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.42])
 by mx.groups.io with SMTP id smtpd.web11.54616.1730716424810219615
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Nov 2024 02:33:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=iL9+BUfJ;
 spf=pass (domain: cherry.de, ip: 40.107.20.42, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cJsf8r5IPH39tjW+kP48p0yGEgzyhJXskaCuuJw3md0NGz1oDIT/+BF5Ol+pPwCmRkUUeiAxtOjNhNLTuwAeIMBjn+jtRoTcKjffNOuLzVm677u6uvGw/OEbLHj0f8wSFO/vVmCo2TKB7HFULJ6vO2R/qqnzOo3YggsmpKKG/BqSanGhxKtjWbTe79GY3fLs2tLlK8OPXyYkp+6fX9fnHlCASbTwSC4g/StmWQYB947BfH40LzhzHvIrU5/xZL/4rdKw21y6Wp+KLhkPE4iq/b1uyapRfvPLe4Tioxp/jUwLhCXjp3vyaVVn0y+NQd857AT9nVuXDQ4St6lSmry0DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHgZ44Gi/Sc/ptVmf8Tfkh4X59cWQSzRwjEjGDAw1hU=;
 b=dKvsX8+4oHVyznt6YgL4DWP+/e0vQDYzDsaCHKDkOSlxRr3N15ZixUSp9qnNtc1YSjL1KfK0Kaz+375Ukn/oYu9LZRfP6U8OSeFUJZoItVQ+Gc8cxXC7oXjDthKrOY7JbpOY450pxsiyVRJdvdy45ejMvGkP01VJACrA7ABZyLPf196Y18YZjtQ1jCskoZxh/eptQiqR4Fj9ia6brvq9gfrEqdX4IB5HaN/nPCizMWmvQ8gCMOtrpkUCBmVziLw8CGeVSmP3u7fCfe5RiWpVDadqD/GY0ozsdBbfN+f7+hnYmXfUSvc8tZRFOLdUByqgZEJqbLtnJZ8Xj8u69XgPSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHgZ44Gi/Sc/ptVmf8Tfkh4X59cWQSzRwjEjGDAw1hU=;
 b=iL9+BUfJyCbQLd482a1jWOk1zBPh0gpY4oRtul8a72KJcqunjAtzUON9Kmvv5wKXwcYQpLeAMhkJ4nln9VgXafZzCa/widRt2lirIxWk/G7G87K7mdwV3E+QqjiLsCFPQREOhic7z8YhWpOck5VLRmvNbezF6si2moyrVmn0hQg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM0PR04MB6930.eurprd04.prod.outlook.com (2603:10a6:208:186::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.29; Mon, 4 Nov
 2024 10:33:40 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 10:33:40 +0000
Message-ID: <337392e0-c192-49d0-82fe-0eaaa9d43953@cherry.de>
Date: Mon, 4 Nov 2024 11:33:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] conf.py: silence cve role already registered
To: jstephan@baylibre.com, docs@lists.yoctoproject.org
References: <20241031-fix-cve-add-role-warning-v1-1-68e44c7e8961@baylibre.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241031-fix-cve-add-role-warning-v1-1-68e44c7e8961@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::13) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM0PR04MB6930:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e7b24e3-6664-4b89-d9ee-08dcfcbc2636
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UUw2dnA3SVNDZnZmcDJDSk4zODB5MDhDS0hQMHl0UFJ4R1laYmwwdmI2UHV4?=
 =?utf-8?B?RWJYeW5mUW9GNjMyaWNhZUppZkFhZ1Z2NkJ5eUkvajlKL3ZrN04wQ2ZObkt3?=
 =?utf-8?B?czRxczRCRlAwUnNVN0hlWHludkJRM1hFU29GTTBWZWF1aEhaclQ4Q1NTZ3pH?=
 =?utf-8?B?WlltcHNMMmhubE1UWnlpK1BhUmpKWHhyeDV6VSt1eVREU1Bxc2lpQnZ6bWRQ?=
 =?utf-8?B?bWpXcTFIQlNmRStaakJJRXlvV3k5aU1xQkppd1hTeERCdExZbDl1VjZZMnZl?=
 =?utf-8?B?ZzBiQk54NVpmTks3OVhsUkxIa0I1NWsyZU9nMWlja2EyS1JaRU9oTEY2RGl4?=
 =?utf-8?B?U25EVDJSVWo3Z1dPcVNHLzdJMWN6NzBRU2pTVGRpd3o0TVBpazNSdlVLQmN5?=
 =?utf-8?B?YnlQanFTOXpDR0liT3JzbHJ1eGc4UXpXU0h2Wi9RRzY0QnNmSlZpNGY3ZXNq?=
 =?utf-8?B?MjNDWnI5SSsyS1FrODVGdWJOeE1Jb1NHTzZRSHFwNEJTVmpSU1N0TnpMNHlz?=
 =?utf-8?B?bXVQVzJNQUtwbUtwMHd0V2QxT2ErQ2xVbExCWFN0T0VZcWRtVlh4OHdoYUJ4?=
 =?utf-8?B?WnhTNVJrdjg1SkMzL1BSd3ZzUXoyZkR2T2twRU1XVkZPdVhZQmZBZ3lOQlBD?=
 =?utf-8?B?UlcvTWM0R0ZrZEtVQjZkZEwwM1FFSlJJaHY0UjhZTmJDWVJyaEkrcVd5ZUty?=
 =?utf-8?B?SzdFa3B2UmZING5uTEhnc0F3N25LUkFxbUhyNXg0a1g3L2FSSTlPa1Rvd2Qw?=
 =?utf-8?B?QnhOcDR6RGJRd21qU09GaXhPR1dUOUVSdks4aXhseHd6VDlsSGQzRDVEYW50?=
 =?utf-8?B?MzBaNC9wWWpJMVNzRXk1dkJwZ2hwTHRITEhuV0JFTVpYNXJyczV6WjU2bkNy?=
 =?utf-8?B?U3JpS1FDM2l6OFNDeXA1UXAzdTB4bGgvcGZxNHAxeVk5TkpkaGhXYWJDWGlQ?=
 =?utf-8?B?aHhyKzk5WGVXM0FFbkRUNnpzc0l4a3N1UTNOcUJERjkxTEdmd2R4OFhsYTRn?=
 =?utf-8?B?OFVQUThRNEZVRk1XbUNIZWhnMzB4ZktRRGYwMDQwSU9oTXNqY1RvcjhSVTBn?=
 =?utf-8?B?bzA0dytPVXV2MDdEZWtpYVZTNWNlVXRQN2VhVlN2Tm1hZmJlU09RdGlDcTZD?=
 =?utf-8?B?VWNmazZYV2p0dCtleHRQelBCVHBQYjNDMHZTOHgrNHMxd0o0YmtFallIODhY?=
 =?utf-8?B?cHFIZmpHT0dabkZaZm1yRnAreWxCSmExcUhKczVxbHBtUENaclNrbkVNeU95?=
 =?utf-8?B?NnQ5eldkclNMTWJvVVB0bWkzNlJzNUdHeXgwNEoyaVIvTVQ1NGdmNDF6SFF4?=
 =?utf-8?B?SDlsZDVJUTV4bUxCU2pSblBPRTZSYlpCanFLdmhXbE5mZjd0T2lUTEVYd1RJ?=
 =?utf-8?B?YW5YRlZoYlFKSXVJWVgzQTFZa1NaVzV0T01IdjRMTndQc1hsQ2h2Uy9VT1NH?=
 =?utf-8?B?WHpGSjVMT0xCNHJ6UDdWZHNtOGhobkVRZ2JsOENBRFNKWkZ4M2pJamEyUmhN?=
 =?utf-8?B?VXFhMFI2d3dTOXkwblBsekZxUE03ZTJ5Tks2RnE5a2g1TVFhd3g2RitMRTd0?=
 =?utf-8?B?RVptV2VVbjJMUlN6UG1EV3hsU1NGd3BzbEl2VlZTYXVranBPOTlMVkluNHFn?=
 =?utf-8?B?TUg5K1J4OHZqQlJSZkVWNGtmOGh6b3JKdER2enF3T2ZZeDczL0liVG1Wc3Mr?=
 =?utf-8?B?cmNkKzBSb3lGeEVOZTV1anZnQVZjVkkrQzlsclhXQTcxZHc0UFdwZ0YyVnJv?=
 =?utf-8?Q?7/FmiB/0S0XWNP4f2VcktL5K+XcMXqSc0sghSoR?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UlBuWUNGS3dSdXFLL09TR1ZzTTVGR2o5YlZMa0E2LzJudVpXNVVHM2hZdXds?=
 =?utf-8?B?Q1pReGs0N2MyZTZ5ZDNRdS9pQUFRNWZGWm9zaWtZNU1CekdaR0tuNi81SGRu?=
 =?utf-8?B?RWNDWk1IaDI3dGphUG9sb09meGVtU3hsOVhqWWJad0tZd3JNMlVjOXBZcWJE?=
 =?utf-8?B?QTUyeXp0T25vMENyZm9MYWNFM2NFUHdDdUxvME1TdWJuQUJaNTZZc040SDAw?=
 =?utf-8?B?bFYwNzZBSkc2VEE0REpERDZWelJlamV1SXFza1pKL3kzSHR5QURGbWZWMXhE?=
 =?utf-8?B?Sm9xa2VIdzBub29MeUovVVpPUmd5eUVVRzlmU2VWM21JWFJuS1BhTlQzRFl3?=
 =?utf-8?B?amdUK2xtekExUkhlbXNvMnk5Vkp2bUpCcGF3U3ZiTlNQYWJCS29MRUdWVCtx?=
 =?utf-8?B?VzZrTk5oSzhGRFYxMklldVFJRjNNSXQyLzdnTkdBMW53dk5KRXowMDVRa0Vo?=
 =?utf-8?B?WjlaY2kwMk5nazViaHZjc29qNlZheGExV1ptSVF0VXB3MXRCVFNYU0RXSzBu?=
 =?utf-8?B?OXdGbmdRZndpUXZQbVF4OVc2MmRlQVQzbUtUTy9sUjd2ZENrcXlERDVjQVZi?=
 =?utf-8?B?d2YzVWZCai8rRWc3cVRZbmFESS9XWWRNSWFNNDdFRm5lM2cwU3htb2xROVM3?=
 =?utf-8?B?S1doV3h3UlJNQWdVRXNZRDRFWHhkYU9KSzI2dk02eG1GMzgzSnlGNk14cG9S?=
 =?utf-8?B?U3VSOFAvZnFWUitiZWpoRnVZTEUzbGFkRS9UZExFanh4VFhYYmN1elBsSDlL?=
 =?utf-8?B?UDhxcy95MFpFM0RuSTN1dmUzQ1FoOENqYU4zd0dHVlQxSXBZWFhTTnZvQXFS?=
 =?utf-8?B?eVJNSzZjL0g3YWcwd2h2U280YW91QkNUUUtsamNRZ2Rvelk3cUpWY3pOK0FG?=
 =?utf-8?B?K1YxVmlrZFF1QnU1c2FWRGNhYWhraFFsVEtYM2o1akpXR0pmUFJzY3BaMTRZ?=
 =?utf-8?B?bkw4Qml3azRZSDFPaXpDRXlYNFRiYmk1aXRWTEVUTU51NUZtTXBkbFhwM3pq?=
 =?utf-8?B?ejhwUVp2S0hYdHNuVWJ1eGp4WHIwMnlGSC9UNzhtV3Nya3F5Q1dQb1JvaW5u?=
 =?utf-8?B?WE1kbW8wYVovTC85aXZ2bnJLTWhHeHc4Vm14eEVobEtjTk5RTXhta3Z6Znox?=
 =?utf-8?B?cVgzdWNOcXJ0MWlsU0pmSWdHR1hpQUJsY3pQVWI0M1RmbmF1ODEydk5xOVN3?=
 =?utf-8?B?R2VldVZiMEprWGU2UFlJL3hid25RWXh6LzlJUEVjdm5OUTNBUkVGMThKamtz?=
 =?utf-8?B?VnpXQWtyYXZteVNibEo4ZmZNK2lIWHc3cG5jRE1LNTErbUM1cVRSTDlnUW1n?=
 =?utf-8?B?YXd0bUxaeS9SNmNqZHFDbVo4TlhheUdaZHdES2owUkV0NDViOVVCY2daUzRn?=
 =?utf-8?B?dTdwWFA2OW9sUUhjc3ZXM29aOWUvOXF3dW1yZndBZXNuc3phNVhNcmxHNkh2?=
 =?utf-8?B?Ri9FSXJrakxPajVSMEE1U3U2RHZOczZ3NWc1b0orNUN3aGwzdTdtTkhDYWpO?=
 =?utf-8?B?d25zemZPMkd5WXhJMU1DM1VhYmhvQllnakE4S25RdlhZd2UyaXBTWUtrSmEw?=
 =?utf-8?B?eTZEOFBQTzVhNjhNVUIwOUk3NnNIdms0NlYwNnRTTnU1Mm5FT2txTGsxREtq?=
 =?utf-8?B?Z3VRVHZpZG9yd0dkZmx6RGwyR3JhY3ljdGhJTmRqazErNXpSNkFES3NRaktm?=
 =?utf-8?B?VFRObklYem81TmFodWM0NVEydUNkeGhQR0lRd2pZMjhSUnkvT1FtbFY2eWx1?=
 =?utf-8?B?OUt1eGl3RzdtdHpzUWhsRzgzWnNGaE5vK0dSZVg2bDdrTm1NQ0hFUkJrQWpw?=
 =?utf-8?B?OG1QT0MwcjN2T1VpRTdxQldqd2plbG1mRHVnNWU1NXNFUjU1VUpSWUxZZ0xu?=
 =?utf-8?B?WmVEMjVENzkrVkFCa1dkb2FmSkFoL0ZWMk1yRVJVL1ZiYWhBeHBQNlg2U3Nu?=
 =?utf-8?B?N3RGK21pREtqSFcyTFRHMTUvR3ZFWHdtb1ZybWR2aWp5Q2pzYUNaZlhCSkNO?=
 =?utf-8?B?d3ZNS2pERmdQL0J1VC9EU20zNXpWUTlzZ0ZvMjdnTEprbmhHWTF6d1pkWWFM?=
 =?utf-8?B?bEdibDJobWRpVlFTTWtnSU12aXVXanVvdWJMODZoK09jUDUzM1dUd3JkYzN4?=
 =?utf-8?B?S3Y0bTYrcGJZK2NVODlBMGdGU1lhY2VHOFdFV0Z5VHZsMGtaQ2V5S1JDUG14?=
 =?utf-8?B?aHc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e7b24e3-6664-4b89-d9ee-08dcfcbc2636
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 10:33:40.6826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fakJHVQouRnwrviy29qs1aPfqtIb07e+4D7+KFigQWUttjWUwdPUkFmp9ahJ9CDID6tYzK/1HKe2XsWjp5JJBXaLKatLjaEV1cfU8xWgAH8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6930
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Nov 2024 10:33:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5648

Hi Julien,

On 10/31/24 5:52 PM, Julien Stephan via lists.yoctoproject.org wrote:
> Commit bd9add8a0 - conf.py: add macro for Mitre CVE links
> added a new macro for mitre cve links called "cve_mitre" which conflicts
> with the already existing "cve" role.
> 
>    WARNING: role 'cve' is already registered, it will be overridden [app.add_role]
> 
> The warning is turned into an error making "make html" fail, but
> documentation is still successfully built.
> 
> Since documentation is still correctly built, just suppress the warning.
> 

I don't understand the issue and why Sphinx complains about it.

I'm also very wary about just silencing a warning instead of tackling it.

I don't understand why this triggers it, extlinks contains an alias with 
a base URL and a caption. The only overlap we have is the CVE-%s 
caption. But why would that be an issue, it's just text!

Also not sure what Antonin meant with "make the
links point to NIST, as expected.". Which ones? What's the actual issue 
here we're trying to fix?

Cheers,
Quentin

