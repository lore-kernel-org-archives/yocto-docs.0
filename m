Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC87C46467
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.12616.1649779545244890469
 for <docs@lists.yoctoproject.org>;
 Tue, 12 Apr 2022 09:05:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=MsCRDe9b;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=110170666e=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 23CFbAF8010276;
	Tue, 12 Apr 2022 09:05:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=content-type :
 message-id : date : to : from : subject : mime-version; s=PPS06212021;
 bh=M25nGZjlnW8F7sdKhJkwH8S36ttj4ak3FS7/NQfzEM4=;
 b=MsCRDe9bepVC/2lT/kHN6/3SdyE7Jfy4pybHqDnBHb6QWnrDHUwT0VUpooSnbhv51SZa
 OuqqV8h65/A9aVz9Coc2IoZLrAArxkTv+ppmRPhG129OqAQukMr1Q5gMiesEi3V5Z44w
 eIjcmoMsQfGadmfNsRstFMBHCdou7AzdSatkHjnCDENpNPuNhXuu0d0/ET3AVtyuAjF7
 nn3hqR+9TeRLJsZKyTBI348sCeK4ACaNil2NoEp3IF0tMCOQFEUZj+LwlgomnCo+UNDZ
 0y0WbCe6tBfbZRklYIcsOTSLL6ZBDHwZ1rldgauldvVaLGHTpo78qGUMvo/Xre9H/oYJ /g==
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fb9nft95x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Apr 2022 09:05:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DTJDWqRHOeICOVcN8/JTyc1I7wuDtYAxznQKpBhT/ohpTNuOB3Fpo01IUJef54+MPjQ6nNbZ+DI/T7Ah+hDClQD0r09dAfo1theneTtgQJuOhvtU78l5vvT7VMhHXwnXSK+myernoIbDFSXMCEmihdEiuhHyr8eKiCwIoiXgS9Znh5D0UOlj48ekmFIs7eWn8CMFzkHyYmh68Kd2a34sIjxIjqymNJCUGLth+oTUP6+BV//88AAYREDm9gYZOOhiMrXZOznYJZUzc7ofCeuWRGogC8NTJheA+fguZLj8+FrwwOGZYN0aF/3MdnuC+L0AtIDYsPZfjxC9V8t7HEh8fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M25nGZjlnW8F7sdKhJkwH8S36ttj4ak3FS7/NQfzEM4=;
 b=lJpwpvnbcAIFFbXxMOH2JvOmFYexYg0nZo30X2HGr1MaJ6lskUhNNegTh2ko617/KzljNvOx2w1bYZxpQqPsRjrblEIA7SoC0Owd0JXWb9xt3ARXNZ5qGFqIM6/iEGLmfBPV5XTWI/oOUj+rFsxq//7C1UijvShrmVeivqVhgg6k61/bw+RiSjn5pxXy+/IK5MJ25M27r26g3hdMpVH3MI481toaJAs5+hlZSEv8fTDFhc5lzW9nyj0YBVGy9Mkc/SPdVu6xMSP+LNoNFwQRPM12aHY4hryZyu2dYUHPcDhMiyNc4fqjoeTomkU0rvJWZSYWyCMCLqXGoTAL7ueZGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM5PR1101MB2203.namprd11.prod.outlook.com (2603:10b6:4:52::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 16:05:35 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::74e9:1bc2:e541:85]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::74e9:1bc2:e541:85%3]) with mapi id 15.20.5144.030; Tue, 12 Apr 2022
 16:05:35 +0000
Content-Type: multipart/alternative;
 boundary="------------SxIIUfisQbcKLtcVwYFrS0ya"
Message-ID: <2fd29235-6c93-a911-944a-f78dd7a27904@windriver.com>
Date: Tue, 12 Apr 2022 12:05:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-CA
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
        docs@lists.yoctoproject.org
From: Randy MacLeod <randy.macleod@windriver.com>
Subject: YP Quick Build: errors/annoyances: ubu-22.04 docker container
X-ClientProxiedBy: SJ0PR05CA0096.namprd05.prod.outlook.com
 (2603:10b6:a03:334::11) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0937a38c-b9a0-43ac-1ad8-08da1c9e470a
X-MS-TrafficTypeDiagnostic: DM5PR1101MB2203:EE_
X-Microsoft-Antispam-PRVS: 
	<DM5PR1101MB2203F9E7ED45F2CE3B98E0B6F8ED9@DM5PR1101MB2203.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EGrQsdS62yG7EWuWZVev+voVN4jHjJSYP1j324glTssBJASRDgjd4dXlGfvbYab0xk6QmyN9jf/H1hwcgoYKHR+EEuAFj/IYAchR7J4BHHNSziypN4Dyz4ejoZ6LtuQcVdharE1uHCYPCAu03LYVz9ENBZx+L/8WpQQ6lG2MnlmcPWUNuuBpyZpKJDOMGXQzQXvvqj6x3SpfVEaxFfxziH9z2Zl4MOnfu092iAM2XhNntygr0aLA+KdXa2edhNoS5gycQIfY2nBT+rhZKwdFZGyjZoHsGs/hFfsaQcdCb2UhFrd23/cbnUYuk/sddToMLoA3yCpV+HcOTuBnJDZG3ngUamRANW+ebjVjb5y2JUCjsHHOmjoqC9EXwUaFdOLHLdr4HLDWXX9XafTP9C8MWeIT8To/RG6/nNRwyAHr5mzMCX3W5iPpXPRsIMOmUb9J67/XX+gFVWR/4f0unSeKxBNMtmjIUiQrH3QA6IeeHy8c4cSLo54z6pi2+x2iVG9SeTyiI8/GdLtanVI8ACVylK5yGN9x7esjvNHicvN235rzxQC0BEemT0caCXRFPeWVdGVvXPJeqpI2GGjkYWVcQaR4J0FkZcJZ5ZCyR/6+kRxGdKrHKCtLNOlMKV/cHzRjX0H6/x05JxzuM2gwh6htrMQFYHnztbWmn2NqDjFD1FuVbFG6aODKeuMaNvPUIbakMYdExywImdLQBiwwrTR8b231zPJ02Ap/UUQG69AWfA+hMXGz4/VMgCF6AE+QAW7g4JWR3IuUntf8sIX0DA3JO7mClXf6dAWotXr9K2EtzbSK4hNEb8X1ZjZvQewVjjBddBsXL7gUUAAJEFA8PVAfe8GR7xVL6DUzTUFMZPK1q58=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(6512007)(2906002)(166002)(38100700002)(38350700002)(52116002)(86362001)(316002)(8676002)(21615005)(6666004)(33964004)(31696002)(66556008)(66476007)(66946007)(26005)(8936002)(5660300002)(186003)(83380400001)(2616005)(966005)(36756003)(6486002)(508600001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TjBWZDd0alVvWUtQYm1pQ1FiYTBmZEp4KzU4bGhOUUpSR0k1ejZPbnNKS2RC?=
 =?utf-8?B?QnFWenFyeXVDR1N6VjlldVZvdS9NVUg3MHJweTZieWUwck53TFlTeTZBMGZD?=
 =?utf-8?B?dDE5dmRNWlFnRHBaenN1SzBlUklEdWpyTXRhOE5CNURzWXdSeWJabXIrVzNN?=
 =?utf-8?B?Z0V6YUFyNkVPVFdPTHNwSEpNa0RJTHNES2RuNnd4cXlPb3VrY2RqQzZGUG13?=
 =?utf-8?B?eHJOc3ZVMzkzemxUcFdwWXY0bnJkNk84QVVTR2RFVWdQWVFnYi9EYXJ4Vm9Z?=
 =?utf-8?B?MUR1WkdtdmtVVW14VUs0eUFIMnlrTFpwUERZNlhKWnpVTWhOQnFRZWV2R0tX?=
 =?utf-8?B?THNHdkY0YTBsZEtQQk1taGdkTURPaHV2Z1Z5SHEySytMaGNFeWRONm5hYmhH?=
 =?utf-8?B?Zis2S0lmMWRqTVVCamFzQ0ZkV2pWRFBnSWxyUGdXMWM1akR5dHkyVm1HUFF0?=
 =?utf-8?B?WWs3dUVDVDVkQlZ0YXl3YUhZbzl0V3U5OTdiVGtaSGM5OVM1YmdjQzVvbHBI?=
 =?utf-8?B?OWZVYVIrbkpxR2JUSU8ra3JOR2FOTk1sOUNqVlJodUxNMGtLdmR3bW1jc25v?=
 =?utf-8?B?VDFjVWx2Z1lXYThHOTJLTUdIb0F0dHVOcWpwNVNPV2RsQ25CdHpONWk3RFZj?=
 =?utf-8?B?Y0h5cVJlV0VqbzFmOEtLQi82eUxpMkVlL0ZhZXAyL3dBaitoT1dzWG4wK2NN?=
 =?utf-8?B?RFpnMU5lZHBSMzdzU3VOYkxlaHlqTnNBTUMzTm9YdG5Dd1dMcW1rektOa0tY?=
 =?utf-8?B?bUJWWmU4amU4dVdCV2lwaDlmRTB5V0xqc1NMTTA1MUwwbHlMa1ZuT0dRNGJU?=
 =?utf-8?B?b0pTL2JJRjZXTDV0VnNOY0pCY1FraHYwMDF5bnova1UvTXRUVGFtZWYxTzBa?=
 =?utf-8?B?VnZVL2cyaTU2UjcyRVZ0MStraDU0Y25uMFdrOE5BM3dFb0NYQ2wyM1hOckM3?=
 =?utf-8?B?czkveHkvMXllSFN1M2kzc0dzeFRuN1RZZEV3SzZzL3lQZjc1K2lXNGk1L0lT?=
 =?utf-8?B?Q2RkY2xJREEwRzBsN1RML3VsLzJvQktSZ1IxcFpwUWJjNTZycUZDemdqWGJD?=
 =?utf-8?B?VFpiVEkyakt0QWRWRGdNZkdnWldJWnpTYThwMnhPSkpZWXFhY2hVbDIzMVRG?=
 =?utf-8?B?YzR6ckZhU2h1Y3pFbHgxQ20rckIxZUpWSnRYcDhLZDgxc2ZnclQ5Z1pBajBD?=
 =?utf-8?B?R3lMK1NzaFRJM3V0MVd2UnBBZCtpUUo0M3hqMERzYU5KblhSYVZQcjlOQlFo?=
 =?utf-8?B?TEdiaGs5VlRKVEJ2RzdLRkxPNU52bGhVWG1oQjRDclhERFdmNTlnYXFLZk5y?=
 =?utf-8?B?NWx6Q1lNUDBXMzZoS3N3V2s5UDRHQ0pLYzNMRkRJMXI4c1kvRlNPS0hQN3Fa?=
 =?utf-8?B?Skh4ekdRd0V6d1RsTU9yWkhUdkpVLytqSDRScU9rZWNnZHk0SDBPQzUyK2l5?=
 =?utf-8?B?VFZwaTJwVU1ib3AxbWJlc2RKZHFIQ2hnalJhd1FRRWM4d3VuNVUyckhrejF0?=
 =?utf-8?B?RnI4a2Rhc0VoS0hYL0Q2dnFMNnpHMUlEbzlGTHZuOURuUDhXZDVMd2tKdE1D?=
 =?utf-8?B?T0IwUzFwQk9ra3ZEWm5BTDdRMmlvOFBFZ2JGQ2crZERWTG00dFFsbVZ0SWpY?=
 =?utf-8?B?WllpUDJQcEpJK3ltdUdPRHQ5VFVHTnF4RUdHa3pkZ3E4bVBOWmw2R3F3cjdr?=
 =?utf-8?B?cFAycUQ1aUNoa1Q2SUVNb1hJdDRyRUE2K0ZDMENaTVR4TG1SS3E4VGFmSW1r?=
 =?utf-8?B?VHFMVU5QOW0xbXJKcTQ3Y0NkclFKQTlyRHhvNHJ3aTNGb25JMy9jUzgwVzVR?=
 =?utf-8?B?TjRTWG83RUp2WmxzdFVnZWtuSjlFZHh6YWt3ekx0NDQra0JHOWNLdnpoa3dD?=
 =?utf-8?B?blh6anBIL3ZZNWZqNE10ZmcxdFliTUhMS0JYbkZPb0dpcWN5YmwzTjZhK3Bl?=
 =?utf-8?B?bHMrM1pFQnk2bWp1SDJna1dsWmIxVlArRmhUQ0c5c0cwaHhmTnVDSG43SXBO?=
 =?utf-8?B?MkgwZU5NV21HNlB2YnRFUlMvOWF2R2NyZ29ka1V2c1JRc3MyOTNWeXh6LzEz?=
 =?utf-8?B?a0VsTmY1SWltTDFXT0U0MUhjaXNHdUxTbDhKRk5qM2pFbElNYmU3WWVieWpx?=
 =?utf-8?B?TVhyS1BzMFE0ZGxOaDFXTk9weVhxQ21WSHVYanZLYVBpVy9BSURzU0l0S3hH?=
 =?utf-8?B?VWJDbElxZGo5UmxQclByL3U3SWRCY0dSZWNBRHFoOWE0UkRucXdRbmRzOVNJ?=
 =?utf-8?B?bTdaemw4NStZcmx2K3JyaURCb3ZWR1NyRys5M1pzc1VzVTRINWE4Ni9PaGQ3?=
 =?utf-8?B?NTkzdGY1MXJKOG11eTlxOGZWYjBiTjJoODBkSUl1OVhyR1FNRjl0Z1RUUnVz?=
 =?utf-8?Q?v3laGyIA7rA4v63oY5BozR/5ph/JdwdxgMzmg?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0937a38c-b9a0-43ac-1ad8-08da1c9e470a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 16:05:34.9851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 20ec91LDfoYl624+mZLpDvyEapHjV7TTSTZkBSXM+ajMHrLr0lrDdGObtaiojNWaoipthYQCdRiKHH65yMhZ48R/DvhaKtUcWIToov/IeiY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2203
X-Proofpoint-ORIG-GUID: 0t5OolvQwcqIPJroDlpudL4i3Se-LTrW
X-Proofpoint-GUID: 0t5OolvQwcqIPJroDlpudL4i3Se-LTrW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-12_06,2022-04-12_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 clxscore=1011 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204120077
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 12 Apr 2022 16:46:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2761

--------------SxIIUfisQbcKLtcVwYFrS0ya
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 23CFbAF8010276


Some things I noticed when using:

https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html

to setup a docker container running ubu-22.04-beta .
$

$ sudo apt install gawk wget git diffstat unzip texinfo gcc build-essenti=
al chrpath socat cpio python3 python3-pip python3-pexpect xz-utils debian=
utils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev =
pylint3 xterm python3-subunit mesa-common-dev zstd liblz4-tool

should be:

$ sudo apt install gawk wget git diffstat unzip texinfo gcc build-essenti=
al chrpath socat cpio python3 python3-pip python3-pexpect xz-utils debian=
utils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev =
pylint xterm python3-subunit mesa-common-dev zstd liblz4-tool

i.e. s/pylint3/pylint/


and I also see:

$ bitbake libarchive-native
ERROR: The following required tools (as specified by HOSTTOOLS) appear=20
to be unavailable in PATH, please install them in order to proceed:
 =C2=A0 file

and
$ sudo apt install file

fixes that.


Finally, there's no explanation of how to deal with:
$ bitbake libarchive-native
ERROR:=C2=A0 OE-core's config sanity checker detected a potential=20
misconfiguration.
 =C2=A0=C2=A0=C2=A0 Either fix the cause of this error or at your own ris=
k disable the=20
checker (see sanity.conf).
 =C2=A0=C2=A0=C2=A0 Following is the list of potential problems / advisor=
ies:

 =C2=A0=C2=A0=C2=A0 Your system needs to support the en_US.UTF-8 locale.

Should that be part of the quick start or is there a section of the docs=20
that
already covers it for supported distros? Likely many desktop installs=20
already
configure a variety of locales.


Should I create a bug for any of these issues?


--=20
# Randy MacLeod
# Wind River Linux

--------------SxIIUfisQbcKLtcVwYFrS0ya
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <br>
    <p>Some things I noticed when using:<br>
    </p>
    <p><a class="moz-txt-link-freetext" href="https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html">https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html</a></p>
    <p>to setup a docker container running ubu-22.04-beta .<br>
      $ <br>
    </p>
    <pre><span></span>$ sudo apt install gawk wget git diffstat unzip texinfo gcc build-essential chrpath socat cpio python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev pylint3 xterm python3-subunit mesa-common-dev zstd liblz4-tool

should be:

<span></span>$ sudo apt install gawk wget git diffstat unzip texinfo gcc build-essential chrpath socat cpio python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev pylint xterm python3-subunit mesa-common-dev zstd liblz4-tool</pre>
    <p>i.e. s/pylint3/pylint/</p>
    <p><br>
    </p>
    <p>and I also see:<br>
    </p>
    <p>$ bitbake libarchive-native <br>
      ERROR: The following required tools (as specified by HOSTTOOLS)
      appear to be unavailable in PATH, please install them in order to
      proceed: <br>
      &nbsp; file <br>
    </p>
    <p>and <br>
      $ sudo apt install file</p>
    <p>fixes that.</p>
    <p><br>
    </p>
    <p>Finally, there's no explanation of how to deal with:<br>
      $ bitbake libarchive-native <br>
      ERROR:&nbsp; OE-core's config sanity checker detected a potential
      misconfiguration. <br>
      &nbsp;&nbsp;&nbsp; Either fix the cause of this error or at your own risk disable
      the checker (see sanity.conf). <br>
      &nbsp;&nbsp;&nbsp; Following is the list of potential problems / advisories: <br>
      &nbsp;<br>
      &nbsp;&nbsp;&nbsp; Your system needs to support the en_US.UTF-8 locale. <br>
    </p>
    <p>Should that be part of the quick start or is there a section of
      the docs that<br>
      already covers it for supported distros? Likely many desktop
      installs already<br>
      configure a variety of locales.<br>
    </p>
    <p><br>
    </p>
    <p>Should I create a bug for any of these issues?</p>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------SxIIUfisQbcKLtcVwYFrS0ya--

